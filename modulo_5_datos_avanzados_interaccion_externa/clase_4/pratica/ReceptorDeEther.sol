// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract BilleteraDigital {
    // Evento para registrar la recepción de Ether
    event Recepcion(address remitente, uint256 valor, bytes datos);

    // La función receive se llama cuando el contrato recibe Ether sin datos
    receive() external payable {
        emit Recepcion(msg.sender, msg.value, "");
    }

    // La función fallback se llama cuando el contrato recibe Ether con datos
    fallback() external payable {
        emit Recepcion(msg.sender, msg.value, msg.data);
    }

    // Función para verificar el saldo del contrato
    function saldo() public view returns (uint256) {
        return address(this).balance;
    }
}
