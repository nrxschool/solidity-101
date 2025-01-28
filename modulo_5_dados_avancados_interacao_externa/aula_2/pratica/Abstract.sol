// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Exemplo de Contrato Abstrato
abstract contract Animal {
    string public nome;

    // Função abstrata, sem implementação
    function som() public virtual pure returns (string memory);
    
    // Função concreta, com implementação
    function mover() public pure returns (string memory) {
        return "O animal esta se movendo";
    }
}

// Contrato que herda de Animal e implementa a função `som`
contract Cachorro is Animal {
    constructor() {
        nome = "Cachorro";
    }

      function som() public override pure returns (string memory) {
        return "Au au!";
    }

    // Implementação da função abstrata `som`
}