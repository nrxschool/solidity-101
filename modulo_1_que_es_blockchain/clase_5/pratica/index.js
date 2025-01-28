const crypto = require('crypto');

// --- 1. GENERANDO UN PAR DE CLAVES ---

// Generando un par de claves pública y privada utilizando el algoritmo ECDSA con la curva secp256k1
const { publicKey, privateKey } = crypto.generateKeyPairSync('ec', {
  namedCurve: 'secp256k1', 
});

// --- 2. FIRMANDO UN MENSAJE ---

// Mensaje a ser firmado
const message = 'Este es un mensaje secreto';
console.log("\nMensaje original:", message);

// --- 2.1. CREANDO UN HASH DEL MENSAJE ---

// Crear un hash del mensaje utilizando SHA256
const hash = crypto.createHash('sha256').update(message).digest();
console.log("\nHash del mensaje:", hash.toString('hex'));

// --- 2.2. FIRMANDO EL HASH ---

// Firmar el hash del mensaje con la clave privada
const signature = crypto.sign('sha256', hash, privateKey);
console.log("Firma:", signature.toString('hex'));

// // --- 3. VERIFICANDO LA FIRMA ---

// // Verificar la firma con la clave pública
const isValid = crypto.verify('sha256', hash, publicKey, signature);

// console.log("\n--- VERIFICANDO LA FIRMA ---");
console.log('¿Firma válida?', isValid);
