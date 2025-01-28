// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variables {
    // Las variables de estado se almacenan en la blockchain.
    string public texto = "Hola";
    uint256 public numero = 123;
    uint256 public ultimaLlamada;

    function hacerAlgo() view public {
        // Las variables locales no se guardan en la blockchain.
        uint256 i = 456;

        // Aquí hay algunas variables globales
        uint256 timestamp = block.timestamp; // Marca de tiempo del bloque actual
        address remitente = msg.sender; // Dirección del remitente de la llamada
    }

    // Función que registra el timestamp actual en la variable 'ultimaLlamada'
    function actualizarTimestamp() public {
        ultimaLlamada = block.timestamp;
    }

    // Función que retorna el saldo actual del contrato
    function obtenerSaldo() public view returns (uint256) {
        return address(this).balance;
    }
}
