// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {
    bool esActivo = true; 
    bool esIgual = (5 == 5); // true

    // Enteros
    int miEntero = -10; // Almacena números enteros con signo (positivos y negativos).
    uint miEnteroSinSigno = 255; // Almacena solo números enteros positivos.

    // Operadores Aritméticos (funcionan con int y uint)
    uint resultadoSuma = 10 + 5; // 15
    int resultadoResta = 10 - 5; // 5
    uint resultadoMultiplicacion = 10 * 5; // 50
    uint resultadoDivision = 10 / 5; // 2
    uint resultadoModulo = 10 % 3; // 1 (resto de la división)

    // Dirección
    address miDireccion = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Almacena una dirección Ethereum (20 bytes).
    address payable miDireccionPagable = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); // Dirección que puede recibir Ether.

    // Bytes
    bytes1 miByte = 0x42; // Almacena una secuencia de bytes de tamaño fijo (1 byte en este caso).

    // Cadena de texto
    string miCadena = "Hola mundo"; // Almacena una secuencia de caracteres.

    // Estructuras Condicionales
    function ejemploCondicional(uint a, uint b) public pure returns (uint) {
        // Si 'a' es mayor que 'b', retorna a + b, de lo contrario, retorna a - b
        if (a > b) {
            return a + b;
        } else if (a == b) {
            return a - b;
        } else {
            return a;
        }
    }

    bool expresion1 = true;
    bool expresion2 = false;

    bool resultadoY = expresion1 && expresion2; // false
    bool resultadoO = expresion1 || expresion2; // true
    bool resultadoNo = !expresion1; // false
}
