const { 
Web3
} = require("web3");

// Configurando o provedor para conectar à rede Polygon
const web3 = new Web3("https://rpc-amoy.polygon.technology/");

// Configurando a ABI e o endereço do contrato
const enderecoContrato = "0x89b81F2bE61200a483CE71D0b239dba16eE32Ac8"; // Insira o endereço do contrato aqui
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

// Criando uma instância do contrato

async function main() {
  // Instância do contrato
  const contratoLock = new web3.eth.Contract(abiContrato, enderecoContrato);

  try {
      // Chamando a função `owner` para obter o endereço do proprietário
      const proprietario = await contratoLock.methods.owner().call();
      console.log("Endereço do Proprietário:", proprietario);
  } catch (error) {
      console.error("Erro ao chamar a função owner:", error);
  }
}

main();
