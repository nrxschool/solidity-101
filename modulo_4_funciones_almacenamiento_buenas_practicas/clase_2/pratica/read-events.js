const { ethers } = require("hardhat");

const fs = require('fs');

// Cargar el ABI del contrato
const abi = JSON.parse(fs.readFileSync('LockCripto.json', 'utf8'));

async function main() {
    // Configurar el proveedor
    const provider = new ethers.JsonRpcProvider('http://127.0.0.1:8545/');

    // Instanciar el contrato
    const contract = new ethers.Contract('0x5FbDB2315678afecb367f032d93F642f64180aa3', abi, provider);

    // Escuchar el evento Deposito
    contract.on('Deposito', (de, valor, event) => {
        console.log('Evento Deposito:');
        console.log('De:', de);
        console.log('Valor:', ethers.utils.formatEther(valor));
        console.log('Bloque:', event.blockNumber);
        console.log('-------------------------------');
    });

    // Escuchar el evento Retirada
    contract.on('Retirada', (de, valor, event) => {
        console.log('Evento Retirada:');
        console.log('De:', de);
        console.log('Valor:', ethers.utils.formatEther(valor));
        console.log('Bloque:', event.blockNumber);
        console.log('-------------------------------');
    });

    console.log('Escuchando eventos del contrato LockCripto...');
}

main().catch((error) => {
    console.error('Error al ejecutar el script:', error);
});
