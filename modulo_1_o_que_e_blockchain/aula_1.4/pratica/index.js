const crypto = require('crypto');

// --- 1. GERANDO UM PAR DE CHAVES ---

// Gerando um par de chaves pública e privada usando o algoritmo ECDSA com a curva secp256k1
const { publicKey, privateKey } = crypto.generateKeyPairSync('ec', {
  namedCurve: 'secp256k1', 
});

// --- 2. ASSINANDO UMA MENSAGEM ---

// Mensagem a ser assinada
const message = 'Esta é uma mensagem secreta a';
console.log("\nMensagem original:", message);

// --- 2.1. CRIANDO UM HASH DA MENSAGEM ---

// Criar um hash da mensagem usando SHA256
const hash = crypto.createHash('sha256').update(message).digest();
console.log("\nHash da mensagem:", hash.toString('hex'));

// --- 2.2. ASSINANDO O HASH ---

// Assinar o hash da mensagem com a chave privada
const signature = crypto.sign('sha256', hash, privateKey);
console.log("Assinatura:", signature.toString('hex'));

// --- 3. VERIFICANDO A ASSINATURA ---

// Verificar a assinatura com a chave pública
const isValid = crypto.verify('sha256', hash, publicKey, signature);

console.log("\n--- VERIFICANDO A ASSINATURA ---");
console.log('Assinatura válida?', isValid); 
