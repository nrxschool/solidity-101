const { ethers } = require("ethers");


// const privateKey = ethers.Wallet.createRandom().privateKey;

// Crear una nueva instancia de Wallet utilizando la clave privada
const wallet = new ethers.Wallet('f91f55bb388df7e8f980428a3d36777d45d164265c64ba15b300eb18f95d4b73');

// Conectar a la red Goerli (o cualquier otra testnet de su preferencia)
const provider = new ethers.JsonRpcProvider("https://rpc-amoy.polygon.technology");
// **IMPORTANTE:** Reemplace 'SEU_INFURA_PROJECT_ID' por su ID de proyecto Infura

// Conectar la wallet al provider
const connectedWallet = wallet.connect(provider);

// Dirección de destino (reemplace con la dirección a la que desea enviar)
const destinatario = "0xCC9e724337542EE66e05a62606eDf93DFF146ff7";

// Valor a ser enviado en Ether
const valor = ethers.parseEther("0.0001");

// Crear la transacción
const tx = {
  to: destinatario,
  value: valor,
  gasLimit: 21000, // Gas limit estándar para transferencias simples
};

// Firmar y enviar la transacción
connectedWallet
  .sendTransaction(tx)
  .then((transaction) => {
    console.log("Transacción enviada:", transaction.hash);
    // Puede usar el transaction.hash para seguir el estado de la transacción en el block explorer
  })
  .catch((error) => {
    console.error("Error al enviar transacción:", error);
  });
