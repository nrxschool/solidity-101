// ethersPolygonLock.js

const { ethers } = require("ethers");

// Configuração do provedor Polygon usando um RPC público
const provider = new ethers.JsonRpcProvider("https://rpc-amoy.polygon.technology/");

// ABI e endereço do contrato
const enderecoContrato = "0x89b81F2bE61200a483CE71D0b239dba16eE32Ac8"; // Insira o endereço do contrato Lock aqui
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
    // Instância do contrato
    const contratoLock = new ethers.Contract(enderecoContrato, abiContrato, provider);

    try {
        // Chamando a função `owner` do contrato para obter o endereço do proprietário
        const proprietario = await contratoLock.owner();
        console.log("Endereço do Proprietário:", proprietario);
    } catch (error) {
        console.error("Erro ao chamar a função owner:", error);
    }
}

main();
