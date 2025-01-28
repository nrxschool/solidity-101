const { ethers } = require("hardhat");

async function main() {
  // Obtener las cuentas disponibles
  const [deployer, usuario] = await ethers.getSigners();
  
  // Obtener la instancia del contrato
  const LockCripto = await ethers.getContractFactory("LockCripto");
  const lockCripto = await LockCripto.attach("0x5FbDB2315678afecb367f032d93F642f64180aa3"); // Reemplazar con la dirección correcta del contrato

  // Depositar 1 ETH desde la cuenta del usuario
  await lockCripto.connect(usuario).depositar({ value: ethers.parseEther("1.0") });

  // Verificar el saldo del usuario
  let saldo = await lockCripto.balances(usuario.address);
  console.log("Saldo del usuario:", ethers.formatEther(saldo));

  // Retirar 0.5 ETH desde la cuenta del usuario
  await lockCripto.connect(usuario).retirar(ethers.parseEther("0.5"));

  // Verificar el saldo actualizado
  saldo = await lockCripto.balances(usuario.address);
  console.log("Saldo actualizado del usuario:", ethers.formatEther(saldo));
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error en la ejecución del script:", error);
    process.exit(1);
  });
