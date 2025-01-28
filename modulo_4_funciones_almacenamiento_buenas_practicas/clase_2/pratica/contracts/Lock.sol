// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract LockCripto {

    // Evento para registrar el depósito de cripto sin indexed
    event Deposito(address de, uint valor);

    // Evento para registrar el retiro de cripto con indexed
    event Retirada(address indexed de, uint valor);

    // Mapping para almacenar el saldo de cada dirección
    mapping(address => uint) public balances;

    // Función para depositar cripto
    function depositar() public payable {
        balances[msg.sender] += msg.value;
        emit Deposito(msg.sender, msg.value);
    }

    // Función para retirar cripto
    function retirar(uint _valor) public {
        require(balances[msg.sender] >= _valor, "Saldo insuficiente.");
        balances[msg.sender] -= _valor;
        payable(msg.sender).transfer(_valor);
        emit Retirada(msg.sender, _valor);
    }
}
