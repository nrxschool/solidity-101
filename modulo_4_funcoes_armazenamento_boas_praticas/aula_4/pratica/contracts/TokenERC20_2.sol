// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ExemploToken2 {
    string public name = "ExemploToken";
    string public symbol = "EXT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    // Evento para registrar transferências de tokens
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Evento para registrar aprovações de tokens
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        totalSupply = 1000 * 10 ** decimals;
        balances[msg.sender] = totalSupply; // Define o criador do contrato como o dono de todos os tokens
        emit Transfer(address(0), msg.sender, totalSupply); // Emite um evento de transferência inicial
    }

    // Função para verificar o saldo de um endereço
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    // Função para transferir tokens para outro endereço
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Saldo insuficiente.");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Função para aprovar um endereço a gastar tokens em nome do proprietário
    function approve(address spender, uint256 amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // Função para transferir tokens de um endereço aprovado
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(balances[sender] >= amount, "Saldo insuficiente.");
        require(allowances[sender][msg.sender] >= amount, "Limite de gasto excedido.");

        balances[sender] -= amount;
        allowances[sender][msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Função para verificar a quantidade de tokens que um spender pode gastar em nome do owner
    function allowance(address owner, address spender) public view returns (uint256) {
        return allowances[owner][spender];
    }
}
