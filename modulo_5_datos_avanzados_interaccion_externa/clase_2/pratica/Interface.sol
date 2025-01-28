// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Ejemplo de Interfaz
interface IVehiculo {
    function mover() external pure returns (string memory);
    function tipoVehiculo() external pure returns (string memory);
}

// Contrato que implementa la interfaz `IVehiculo`
contract Coche is IVehiculo {
    function mover() public pure override returns (string memory) {
        return "El coche se esta moviendo";
    }
    
    function tipoVehiculo() public pure override returns (string memory) {
        return "Vehiculo terrestre";
    }
}
