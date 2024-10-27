// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract LockCripto {

    // Evento para registrar o depósito de cripto sem indexed
    event Deposito(address de, uint valor);

    // Evento para registrar a retirada de cripto com indexed
    event Retirada(address indexed de, uint valor);

    // Mapping para armazenar o saldo de cada endereço
    mapping(address => uint) public balances;

    // Função para depositar cripto
    function depositar() public payable {
        balances[msg.sender] += msg.value;
        emit Deposito(msg.sender, msg.value);
    }

    // Função para retirar cripto
    function retirar(uint _valor) public {
        require(balances[msg.sender] >= _valor, "Saldo insuficiente.");
        balances[msg.sender] -= _valor;
        payable(msg.sender).transfer(_valor);
        emit Retirada(msg.sender, _valor);
    }
}