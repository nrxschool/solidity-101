const hre = require("hardhat");

async function main() {
  // Obtenha a instância do contrato deployado
  const helloWorld = await hre.ethers.getContractAt("HelloWorld", "0x5FbDB2315678afecb367f032d93F642f64180aa3"); 

  // Chame a função `helloWorld` do contrato
  const mensagem = await helloWorld.helloWorld();
  console.log("Mensagem do contrato:", mensagem);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// npx hardhat run scripts/call-hello-world.js --network localhost
