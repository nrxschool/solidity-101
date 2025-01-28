// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Variables {
    uint256 public constant TASA_FIJA = 5; // Tasa fija en porcentaje
    address public immutable direccionToken; // Dirección del token

    constructor(address _direccionToken) {
        direccionToken = _direccionToken;
    }
}
