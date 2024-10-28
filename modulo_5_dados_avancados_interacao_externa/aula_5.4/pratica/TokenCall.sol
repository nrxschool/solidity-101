// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Interface para um contrato ERC20 padrão
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TokenCall {
    address public tokenAddress;

    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
    }

    // Função para obter o saldo de tokens ERC20 deste contrato
    function getMeuSaldo() public view returns (uint256) {
        IERC20 token = IERC20(tokenAddress);
        uint256 saldo = token.balanceOf(address(this));

        return saldo;
    }

    // Função para transferir tokens ERC20 deste contrato para outro endereço
    function transferirTokens(address _destinatario, uint256 _quantia) public {
        IERC20 token = IERC20(tokenAddress);
        bool sucesso = token.transfer(_destinatario, _quantia);
        require(sucesso, "Falha na transferência de tokens.");
    }
}
