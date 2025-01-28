// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title Ejemplo de Contrato Básico
/// @notice Un contrato de ejemplo para mostrar la estructura básica en Solidity
/// @dev Este contrato hereda la biblioteca Ownable de OpenZeppelin para control de acceso
contract Estructura is Ownable {
    // Variables de estado
    uint256 public balance; // Saldo actual del contrato

    /// @notice Evento emitido cuando se realiza un depósito
    /// @param from Dirección que realizó el depósito
    /// @param valor Valor depositado
    event Deposito(address indexed from, uint256 valor);

    /// @notice Constructor para inicializar el contrato
    /// @dev Define al propietario del contrato usando Ownable e inicializa el saldo
    constructor(uint _initialBalance) Ownable(msg.sender) {
        balance = _initialBalance;
    }

    /// @notice Actualiza el saldo del contrato
    /// @param _valor El valor a ser añadido al saldo
    function depositar(uint256 _valor) public {
        balance += _valor;
        emit Deposito(msg.sender, _valor);
    }
}
