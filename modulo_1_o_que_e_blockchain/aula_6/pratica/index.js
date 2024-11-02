const { ethers } = require("ethers");


// const privateKey = ethers.Wallet.createRandom().privateKey;

// Criar uma nova instância de Wallet usando a chave privada
const wallet = new ethers.Wallet('f91f55bb388df7e8f980428a3d36777d45d164265c64ba15b300eb18f95d4b73');

// Conectar à rede Goerli (ou outra testnet de sua preferência)
const provider = new ethers.JsonRpcProvider("https://rpc-amoy.polygon.technology");
// **IMPORTANTE:** Substitua 'SEU_INFURA_PROJECT_ID' pelo seu ID do projeto Infura

// Conectar a wallet ao provider
const connectedWallet = wallet.connect(provider);

// Endereço de destino (substitua pelo endereço para onde deseja enviar)
const destinatario = "0xCC9e724337542EE66e05a62606eDf93DFF146ff7";

// Valor a ser enviado em Ether
const valor = ethers.parseEther("0.0001");

// Criar a transação
const tx = {
  to: destinatario,
  value: valor,
  gasLimit: 21000, // Gas limit padrão para transferências simples
};

// Assinar e enviar a transação
connectedWallet
  .sendTransaction(tx)
  .then((transaction) => {
    console.log("Transação enviada:", transaction.hash);
    // Você pode usar o transaction.hash para acompanhar o status da transação no block explorer
  })
  .catch((error) => {
    console.error("Erro ao enviar transação:", error);
  });