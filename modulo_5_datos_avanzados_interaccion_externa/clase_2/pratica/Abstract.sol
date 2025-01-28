// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Ejemplo de Contrato Abstracto
abstract contract Animal {
    string public nombre;

    // Función abstracta, sin implementación
    function sonido() public virtual pure returns (string memory);
    
    // Función concreta, con implementación
    function mover() public pure returns (string memory) {
        return "El animal se esta moviendo";
    }
}

// Contrato que hereda de Animal e implementa la función `sonido`
contract Perro is Animal {
    constructor() {
        nombre = "Perro";
    }

    // Implementación de la función abstracta `sonido`
    function sonido() public override pure returns (string memory) {
        return "Guau guau!";
    }
}
