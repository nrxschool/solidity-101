// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {
    bool isAtivo = true; 
    int meuInteiro = -10; 
    uint meuInteiroSemSinal = 255; 
    address meuEndereco = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    address payable meuEnderecoPagavel = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); 
    bytes1 meuByte = 0x42; 
    string minhaString = "Ola mundo!"; 
}
