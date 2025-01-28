const { ethers } = require("hardhat");

async function main() {
  // Obtener las cuentas disponibles
  const [deployer, usuario] = await ethers.getSigners();
  
  console.log("---------------------------------");
  console.log("Cuentas:");
  console.log("Deployer:", deployer.address);
  console.log("Usuario:", usuario.address);
  console.log("---------------------------------");

  const TokenPrueba = await ethers.getContractFactory("ExemploToken");
  const tokenPrueba = await TokenPrueba.attach("0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512");
  
  console.log("Dirección del contrato TokenPrueba:", await tokenPrueba.getAddress());

  const TokenPrueba2 = await ethers.getContractFactory("ExemploToken2");
  const tokenPrueba2 = await TokenPrueba2.attach("0x5FbDB2315678afecb367f032d93F642f64180aa3");
  
  console.log("Dirección del contrato TokenPrueba2:", await tokenPrueba2.getAddress());

  const EjemploSeguro = await ethers.getContractFactory("ExemploSeguro");
  const ejemploSeguro = await EjemploSeguro.attach("0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"); 

  console.log("Dirección del contrato EjemploSeguro:", await ejemploSeguro.getAddress());
  console.log("---------------------------------");

  // Transferir algunos tokens al contrato EjemploSeguro
  const cantidadTransferencia = ethers.parseEther("100");
  const txTransferencia = await tokenPrueba.transfer(usuario.address, cantidadTransferencia);
  await txTransferencia.wait();
  console.log(`Transferidos ${cantidadTransferencia} TTK a ${usuario.address} (Tx Hash: ${txTransferencia.hash})`);

  // Aprobar al contrato EjemploSeguro para gastar tokens en nombre del usuario
  const txAprobacion = await tokenPrueba.connect(usuario).approve(await ejemploSeguro.getAddress(), cantidadTransferencia);
  await txAprobacion.wait();
  console.log(`Contrato EjemploSeguro aprobado para gastar ${cantidadTransferencia} TTK en nombre de ${usuario.address} (Tx Hash: ${txAprobacion.hash})`);
  console.log("---------------------------------");

  // Interactuar con éxito con el contrato TokenPrueba
  const datos = tokenPrueba.interface.encodeFunctionData("transfer", [usuario.address, ethers.parseEther("10")]);
  try {
    const txLlamada = await ejemploSeguro.connect(usuario).llamarContratoExterno(await tokenPrueba.getAddress(), datos);
    await txLlamada.wait();
    console.log("Interacción exitosa con el contrato TokenPrueba. (Tx Hash:", txLlamada.hash, ")");
  } catch (error) {
    console.error("Error al interactuar con el contrato TokenPrueba:", error);
  }
  console.log("---------------------------------");

  const randomAddress = '0x329a698a277C3dF4ba7551f8e0f6a4a41755f63A';
  try {
    const prueba = await ejemploSeguro.connect(usuario).llamarContratoExterno(randomAddress, datos);
    await prueba.wait();
    console.log("Interacción con contrato TokenPrueba2 (Tx Hash:", prueba.hash, ")");
  } catch (error) {
    console.error("Error esperado al interactuar con un contrato inexistente:", error);
  }
  console.log("---------------------------------");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error en la ejecución del script:", error);
    process.exit(1);
  });
