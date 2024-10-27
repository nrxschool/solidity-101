// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Exemplo {
    // Variável de estado (armazenada no Storage)
    uint256 numeroArmazenado;

    function exemploDeFuncao(uint256 _numero) public {
        // Variável local (armazenada na Memory)
        uint256 numeroLocal = _numero;

        // Modificando a variável de estado
        numeroArmazenado = numeroLocal + 10;
    }
}