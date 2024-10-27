// index.js

// ----- Bits e Bytes: -----

// Um bit (dígito binário) pode ser 0 ou 1.
// Um byte é um conjunto de 8 bits.

// ----- Conversões: -----

// Número decimal para binário:
let decimal = 10;
let binario = decimal.toString(2); // Converte para base 2 (binário)
console.log(`${decimal} em binário é: ${binario}`);

// Número binário para decimal:
let binario2 = "1010";
let decimal2 = parseInt(binario2, 2); // Converte da base 2 (binário) para decimal
console.log(`${binario2} em decimal é: ${decimal2}`);

// Convertendo um número decimal para hexadecimal:
let decimal3 = 255;
let hexadecimal = decimal3.toString(16);
console.log(`${decimal3} em hexadecimal é: ${hexadecimal}`);

// Convertendo um número hexadecimal para decimal:
let hexadecimal2 = "FF";
let decimal4 = parseInt(hexadecimal2, 16);
console.log(`${hexadecimal2} em decimal é: ${decimal4}`);

// ----- Bytes: -----

// Criando um array de bytes (cada elemento representa um byte):
let bytes = new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);

// ----- Exemplos com Diferentes TextDecoders: -----

// 1. UTF-8 (decodificação padrão):
let utf8Decoder = new TextDecoder("utf-8");
let utf8String = utf8Decoder.decode(bytes);
console.log(`UTF-8: ${utf8String}`);

// 2. UTF-16 (little-endian):
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

