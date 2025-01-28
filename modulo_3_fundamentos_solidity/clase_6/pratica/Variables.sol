// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint256 public num = 123;
    uint256 public ultimaChamada;

    function doSomething() view public {
        // Local variables are not saved to the blockchain.
        uint256 i = 456;

        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }

    // Função que registra o timestamp atual na variável 'ultimaChamada'
    function atualizarTimestamp() public {
        ultimaChamada = block.timestamp;
    }

    // Função que retorna o saldo atual do contrato
    function obterSaldo() public view returns (uint256) {
        return address(this).balance;
    }
}
