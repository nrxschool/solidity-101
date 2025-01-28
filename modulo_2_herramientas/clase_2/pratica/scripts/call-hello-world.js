const hre = require("hardhat");

async function main() {
  // Obtén la instancia del contrato desplegado
  const helloWorld = await hre.ethers.getContractAt("HelloWorld", "0x5FbDB2315678afecb367f032d93F642f64180aa3"); 

  // Llama a la función `helloWorld` del contrato
  const mensaje = await helloWorld.helloWorld();
  console.log("Mensaje del contrato:", mensaje);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// npx hardhat run scripts/call-hello-world.js --network localhost
