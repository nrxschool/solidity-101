// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionsExample {
    // Variáveis de estado
    address public owner;
    uint256 public data;

    // Construtor: executado uma vez ao criar o contrato, inicializando o dono do contrato.
    constructor(uint256 _initialData) {
        owner = msg.sender;
        data = _initialData;
    }
    
    // Função pública que modifica o estado do contrato
    function setData(uint256 _data) public {
        data = _data;
    }

    // Função que lê o estado do contrato e retorna um valor
    function getData() public view returns (uint256) {
        return data;
    }

    // Função pública: acessível dentro e fora do contrato
    function publicFunction() public pure returns (string memory) {
        return unicode"Função pública chamada";
    }

    // Função privada: acessível apenas dentro do próprio contrato
    function _privateFunction() private pure returns (string memory) {
        return unicode"Função privada chamada";
    }

    // Função internal: acessível dentro do contrato e de contratos derivados
    function internalFunction() internal pure returns (string memory) {
        return unicode"Função interna chamada";
    }

    // Função external: acessível apenas de fora do contrato
    function externalFunction() external pure returns (string memory) {
        return unicode"Função externa chamada";
    }

    // **Funções `pure`, `view` e `payable`**

    // Função `view`: lê o estado sem modificá-lo
    function viewFunction() public view returns (uint256) {
        return data;
    }

    // Função `pure`: não acessa nem modifica o estado, apenas calcula
    function pureFunction(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Função `payable`: permite receber Ether
    function payableFunction() public payable {
        // O Ether enviado com a transação será adicionado ao saldo do contrato
    }
}
