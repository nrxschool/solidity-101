// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Define uma interface para um veículo genérico
interface IVeiculo {
    function acelerar() external;
    function frear() external;
    function buzinar() external pure returns (string memory);
}

// Contrato abstrato que define um veículo com um número de rodas
abstract contract Veiculo is IVeiculo {
    uint8 public rodas;

    constructor(uint8 _rodas) {
        rodas = _rodas;
    }

    // Função abstrata que precisa ser implementada pelos contratos concretos
    function acelerar() external virtual;

    // Função com implementação padrão que pode ser sobrescrita
    function frear() external virtual {
        // Implementação padrão para frear
    }
}

// Contrato concreto que implementa um carro
contract Carro is Veiculo {
    constructor() Veiculo(4) {}

    function acelerar() external override {
        // Implementação específica para acelerar um carro
    }

    function buzinar() external pure override returns (string memory) {
        return "Bi bi!";
    }
}

// Contrato concreto que implementa uma moto
contract Moto is Veiculo {
    constructor() Veiculo(2) {}

    function acelerar() external override {
        // Implementação específica para acelerar uma moto
    }

    function buzinar() external pure override returns (string memory) {
        return "Fon fon!";
    }
}
