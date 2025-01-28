// ethersPolygonLock.js

const { ethers } = require("ethers");

// Configuración del proveedor de Polygon usando un RPC público
const provider = new ethers.JsonRpcProvider("https://rpc-amoy.polygon.technology/");

// ABI y dirección del contrato
const direccionContrato = "0x89b81F2bE61200a483CE71D0b239dba16eE32Ac8"; // Inserta la dirección del contrato Lock aquí
const abiContrato = [
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address payable",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
];

async function main() {
    // Instancia del contrato
    const contratoLock = new ethers.Contract(direccionContrato, abiContrato, provider);

    try {
        // Llamando a la función `owner` del contrato para obtener la dirección del propietario
        const propietario = await contratoLock.owner();
        console.log("Dirección del Propietario:", propietario);
    } catch (error) {
        console.error("Error al llamar a la función owner:", error);
    }
}

main();
