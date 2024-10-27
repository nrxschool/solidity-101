// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {
    // Booleanos
    bool isAtivo = true; 
    bool isEqual = (5 == 5); // true

    // Inteiros
    int meuInteiro = -10; // Armazena números inteiros com sinal (positivos e negativos).
    uint meuInteiroSemSinal = 255; // Armazena apenas números inteiros positivos.

    // Operadores Aritméticos (funcionam com int e uint)
    uint resultadoSoma = 10 + 5; // 15
    int resultadoSubtracao = 10 - 5; // 5
    uint resultadoMultiplicacao = 10 * 5; // 50
    uint resultadoDivisao = 10 / 5; // 2
    uint resultadoModulo = 10 % 3; // 1 (resto da divisão)

    // Endereço
    address meuEndereco = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Armazena um endereço Ethereum (20 bytes).
    address payable meuEnderecoPagavel = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); // Endereço que pode receber Ether.

    // Bytes
    bytes1 meuByte = 0x42; // Armazena uma sequência de bytes de tamanho fixo (1 byte neste caso).

    // String
    string minhaString = "Ola mundo!"; // Armazena uma sequência de caracteres.

    // Estruturas Condicionais
    function exemploCondicional(uint a, uint b) public pure returns (uint) {
        // Se a for maior que b, retorna a + b, caso contrário, retorna a - b
        if (a > b) {
            return a + b;
        } else if (a == b) {
            return a - b;
        } else {
            return a;
        }
    }

    bool expressao1 = true;
    bool expressao2 = false;

    bool resultadoE = expressao1 && expressao2; // false
    bool resultadoOU = expressao1 || expressao2; // true
    bool resultadoNao = !expressao1; // false
}
