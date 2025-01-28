// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract EjemploToken2 {
    string public name = "EjemploToken";
    string public symbol = "EXT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    // Evento para registrar transferencias de tokens
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Evento para registrar aprobaciones de tokens
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        totalSupply = 1000 * 10 ** decimals;
        balances[msg.sender] = totalSupply; // Define al creador del contrato como el propietario de todos los tokens
        emit Transfer(address(0), msg.sender, totalSupply); // Emite un evento de transferencia inicial
    }

    // Función para verificar el saldo de una dirección
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    // Función para transferir tokens a otra dirección
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Saldo insuficiente.");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Función para aprobar a una dirección para gastar tokens en nombre del propietario
    function approve(address spender, uint256 amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // Función para transferir tokens desde una dirección aprobada
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(balances[sender] >= amount, "Saldo insuficiente.");
        require(allowances[sender][msg.sender] >= amount, "Limite de gasto excedido.");

        balances[sender] -= amount;
        allowances[sender][msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Función para verificar la cantidad de tokens que un spender puede gastar en nombre del propietario
    function allowance(address owner, address spender) public view returns (uint256) {
        return allowances[owner][spender];
    }
}