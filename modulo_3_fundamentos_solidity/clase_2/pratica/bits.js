// index.js

// ----- Bits y Bytes: -----

// Un bit (dígito binario) puede ser 0 o 1.
// Un byte es un conjunto de 8 bits.

// // ----- Conversiones: -----

// // Número decimal a binario:
let decimal = 1;
let binario = decimal.toString(2); // Convierte a base 2 (binario)
console.log(`${decimal} en binario es: ${binario}`);

// // Número decimal a binario:
decimal = 10;
binario = decimal.toString(2); // Convierte a base 2 (binario)
console.log(`${decimal} en binario es: ${binario}`);

decimal = 20;
binario = decimal.toString(2); // Convierte a base 2 (binario)
console.log(`${decimal} en binario es: ${binario}`);

// // Número binario a decimal:
let binario2 = "1010";
let decimal2 = parseInt(binario2, 2); // Convierte de base 2 (binario) a decimal
console.log(`${binario2} en decimal es: ${decimal2}`);

// // Convertir un número decimal a hexadecimal:
let decimal3 = 12909123;
let hexadecimal = decimal3.toString(16);
console.log(`${decimal3} en hexadecimal es: ${hexadecimal}`);

// // Convertir un número hexadecimal a decimal:
let hexadecimal2 = "FF";
let decimal4 = parseInt(hexadecimal2, 16);
console.log(`${hexadecimal2} en decimal es: ${decimal4}`);

// // ----- Bytes: -----

// // Creando un array de bytes (cada elemento representa un byte):
let bytes = new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);

// // ----- Ejemplos con Diferentes TextDecoders: -----

// // 1. UTF-8 (decodificación predeterminada):
let utf8Decoder = new TextDecoder("utf-8");
let utf8String = utf8Decoder.decode(bytes);
console.log(`UTF-8: ${utf8String}`);

// // 2. UTF-16 (little-endian):
let utf16leDecoder = new TextDecoder("utf-16le");
let utf16leString = utf16leDecoder.decode(bytes);
console.log(`UTF-16 (LE): ${utf16leString}`);

// 3. UTF-16 (big-endian):
let utf16beDecoder = new TextDecoder("utf-16be");
let utf16beString = utf16beDecoder.decode(bytes);
console.log(`UTF-16 (BE): ${utf16beString}`);

// 4. ISO-8859-1 (Latin-1):
let latin1Decoder = new TextDecoder("iso-8859-1");
let latin1String = latin1Decoder.decode(bytes);
console.log(`Latin-1: ${latin1String}`);

// 5. Windows-1252 (Windows Latin-1):
let win1252Decoder = new TextDecoder("windows-1252");
let win1252String = win1252Decoder.decode(bytes);
console.log(`Windows-1252: ${win1252String}`);
