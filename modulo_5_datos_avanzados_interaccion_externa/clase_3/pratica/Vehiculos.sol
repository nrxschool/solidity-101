// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Define una interfaz para un vehículo genérico
interface IVehiculo {
    function acelerar() external;
    function frenar() external;
    function tocarBocina() external pure returns (string memory);
}

// Contrato abstracto que define un vehículo con un número de ruedas
abstract contract Vehiculo is IVehiculo {
    uint8 public ruedas;

    constructor(uint8 _ruedas) {
        ruedas = _ruedas;
    }

    // Función abstracta que debe ser implementada por los contratos concretos
    function acelerar() external virtual;

    // Función con implementación por defecto que puede ser sobrescrita
    function frenar() external virtual {
        // Implementación por defecto para frenar
    }
}

// Contrato concreto que implementa un coche
contract Coche is Vehiculo {
    constructor() Vehiculo(4) {}

    function acelerar() external override {
        // Implementación específica para acelerar un coche
    }

    function tocarBocina() external pure override returns (string memory) {
        return "Pi pi";
    }
}

// Contrato concreto que implementa una moto
contract Moto is Vehiculo {
    constructor() Vehiculo(2) {}

    function acelerar() external override {
        // Implementación específica para acelerar una moto
    }

    function tocarBocina() external pure override returns (string memory) {
        return "Bip bip";
    }
}
