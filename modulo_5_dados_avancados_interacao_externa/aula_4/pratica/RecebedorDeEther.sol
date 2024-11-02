// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract CarteiraDigital {
    // Evento para registrar o recebimento de Ether
    event Recebimento(address remetente, uint256 valor, bytes dados);

    // Função receive é chamada quando o contrato recebe Ether sem dados
    receive() external payable {
        emit Recebimento(msg.sender, msg.value, "");
    }

    // Função fallback é chamada quando o contrato recebe Ether com dados
    fallback() external payable {
        emit Recebimento(msg.sender, msg.value, msg.data);
    }

    // Função para verificar o saldo do contrato
    function saldo() public view returns (uint256) {
        return address(this).balance;
    }
}
