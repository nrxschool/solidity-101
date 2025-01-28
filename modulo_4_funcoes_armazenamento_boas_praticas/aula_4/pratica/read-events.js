const { ethers } = require("hardhat");

const fs = require('fs');

// Carregar o ABI do contrato
const abi = JSON.parse(fs.readFileSync('LockCripto.json', 'utf8'));

async function main() {
    // Configurar o provedor
    const provider = new ethers.JsonRpcProvider('http://127.0.0.1:8545/');

    // Instanciar o contrato
    const contract = new ethers.Contract('0x5FbDB2315678afecb367f032d93F642f64180aa3', abi, provider);

    // Escutar o evento Deposito
    contract.on('Deposito', (de, valor, event) => {
        console.log('Evento Deposito:');
        console.log('De:', de);
        console.log('Valor:', ethers.utils.formatEther(valor));
        console.log('Bloco:', event.blockNumber);
        console.log('-------------------------------');
    });

    // Escutar o evento Retirada
    contract.on('Retirada', (de, valor, event) => {
        console.log('Evento Retirada:');
        console.log('De:', de);
        console.log('Valor:', ethers.utils.formatEther(valor));
        console.log('Bloco:', event.blockNumber);
        console.log('-------------------------------');
    });

    console.log('Escutando eventos do contrato LockCripto...');
}

main().catch((error) => {
    console.error('Erro ao executar o script:', error);
});
