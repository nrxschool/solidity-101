// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;


// Exemplo de Interface
interface IVeiculo {
    function mover() external pure returns (string memory);
    function tipoVeiculo() external pure returns (string memory);
}

// Contrato que implementa a interface `IVeiculo`
contract Carro is IVeiculo {
    function mover() public pure override returns (string memory) {
        return "O carro esta se movendo";
    }
    
    function tipoVeiculo() public pure override returns (string memory) {
        return "Veiculo terrestre";
    }
}
