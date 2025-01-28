const { ethers } = require("hardhat");

async function main() {
  // Obter as contas disponíveis
  const [deployer, usuario] = await ethers.getSigners()
  // Obter a instância do contrato
  const LockCripto = await ethers.getContractFactory("LockCripto");
  const lockCripto = await LockCripto.attach("0x5FbDB2315678afecb367f032d93F642f64180aa3"); // Substitua pelo endereço correto do contrato

  // Depositar 1 ETH do usuário
  await lockCripto.connect(usuario).depositar({ value: ethers.parseEther("1.0") });

  // Verificar o saldo do usuário
  let saldo = await lockCripto.balances(usuario.address);
  console.log("Saldo do usuário:", ethers.formatEther(saldo));

  // Retirar 0.5 ETH do usuário
  await lockCripto.connect(usuario).retirar(ethers.parseEther("0.5"));

  // Verificar o saldo atualizado
  saldo = await lockCripto.balances(usuario.address);
  console.log("Saldo atualizado do usuário:", ethers.formatEther(saldo));
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Erro na execução do script:", error);
    process.exit(1);
  });
