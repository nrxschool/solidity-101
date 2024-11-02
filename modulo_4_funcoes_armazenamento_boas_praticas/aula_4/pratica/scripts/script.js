const { ethers } = require("hardhat");

async function main() {
  // Obter as contas disponíveis
  const [deployer, usuario] = await ethers.getSigners();
  
  console.log("---------------------------------");
  console.log("Contas:");
  console.log("Deployer:", deployer.address);
  console.log("Usuário:", usuario.address);
  console.log("---------------------------------");

  const TokenTeste = await ethers.getContractFactory("ExemploToken");
  const tokenTeste = await TokenTeste.attach("0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512");
  
  console.log("Endereço do contrato TokenTeste:", await tokenTeste.getAddress());

  const TokenTeste2 = await ethers.getContractFactory("ExemploToken2");
  const tokenTeste2 = await TokenTeste2.attach("0x5FbDB2315678afecb367f032d93F642f64180aa3");
  
  console.log("Endereço do contrato TokenTeste2:", await tokenTeste2.getAddress());

  const ExemploSeguro = await ethers.getContractFactory("ExemploSeguro");
  const exemploSeguro = await ExemploSeguro.attach("0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"); 

  console.log("Endereço do contrato ExemploSeguro:", await exemploSeguro.getAddress());
  console.log("---------------------------------");

  // Transferir alguns tokens para o contrato ExemploSeguro
  const quantidadeTransferencia = ethers.parseEther("100");
  const txTransferencia = await tokenTeste.transfer(usuario.address, quantidadeTransferencia);
  await txTransferencia.wait();
  console.log(`Transferidos ${quantidadeTransferencia} TTK para ${usuario.address} (Tx Hash: ${txTransferencia.hash})`);

  // Aprovar o contrato ExemploSeguro para gastar tokens em nome do usuário
  const txAprovacao = await tokenTeste.connect(usuario).approve(await exemploSeguro.getAddress(), quantidadeTransferencia);
  await txAprovacao.wait();
  console.log(`Contrato ExemploSeguro aprovado para gastar ${quantidadeTransferencia} TTK em nome de ${usuario.address} (Tx Hash: ${txAprovacao.hash})`);
  console.log("---------------------------------");

  // Interagir com sucesso com o contrato TokenTeste
  const dados = tokenTeste.interface.encodeFunctionData("transfer", [usuario.address, ethers.parseEther("10")]);
  try {
    const txChamada = await exemploSeguro.connect(usuario).chamarContratoExterno(await tokenTeste.getAddress(), dados);
    await txChamada.wait();
    console.log("Interação bem-sucedida com o contrato TokenTeste. (Tx Hash:", txChamada.hash, ")");
  } catch (error) {
    console.error("Erro na interação com o contrato TokenTeste:", error);
  }
  console.log("---------------------------------");

  const randomAddress = '0x329a698a277C3dF4ba7551f8e0f6a4a41755f63A'
  try {
    const teste = await exemploSeguro.connect(usuario).chamarContratoExterno(randomAddress, dados);
    await teste.wait();
    console.log("Interação com contrato TokenTeste2 (Tx Hash:", teste.hash, ")");
  } catch (error) {
    console.error("Erro esperado ao interagir com contrato inexistente:", error);
  }
  console.log("---------------------------------");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Erro na execução do script:", error);
    process.exit(1);
  });
