const { ethers } = require("ethers");

// **IMPORTANTE:** Substitua pela sua chave privada da testnet (ex: Goerli, Sepolia)
const privateKey = "SUA_CHAVE_PRIVADA_AQUI";

// Criar uma nova instância de Wallet usando a chave privada
const wallet = new ethers.Wallet(privateKey);

// Conectar à rede Goerli (ou outra testnet de sua preferência)
const provider = new ethers.providers.JsonRpcProvider("https://goerli.infura.io/v3/SEU_INFURA_PROJECT_ID");
// **IMPORTANTE:** Substitua 'SEU_INFURA_PROJECT_ID' pelo seu ID do projeto Infura

// Conectar a wallet ao provider
const connectedWallet = wallet.connect(provider);

// Endereço de destino (substitua pelo endereço para onde deseja enviar)
const destinatario = "0xENDERECO_DE_DESTINO_AQUI";

// Valor a ser enviado em Ether
const valor = ethers.utils.parseEther("0.0001");

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