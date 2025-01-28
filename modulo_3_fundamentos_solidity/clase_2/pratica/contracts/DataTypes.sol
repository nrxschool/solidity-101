// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {
    bool isActivo = true; 
    int miEntero = -10; 
    uint miEnteroSinSigno = 255; 
    address miDireccion = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable miDireccionPagable = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); 
    bytes1 miByte = 0x42; 
    string miCadena = "Hola mundo!"; 
}
