// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Configuracao {
    uint256 public constant TAXA_FIXA = 5; // Taxa fixa em porcentagem
    address public immutable enderecoToken; // Endereço do token

    constructor(address _enderecoToken) {
        enderecoToken = _enderecoToken;
    }
}