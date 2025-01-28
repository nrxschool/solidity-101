// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GestaoPessoas {
    struct Pessoa {
        string nome;
        uint256 idade;
        bool ativo;
    }

    // Criando uma variável de estado do tipo 'Pessoa'
    Pessoa public pessoa;

    // Função para criar uma nova pessoa
    function criarPessoa(string memory _nome, uint256 _idade) public returns (Pessoa memory) {
        pessoa = Pessoa(_nome, _idade, true);
        return pessoa;
    }

    // Função para demonstrar Value Type
    function demonstrarValueType(uint256 _numero) public pure returns (uint256, uint256) {
        uint256 numeroLocal = _numero; // _numero é copiado para numeroLocal
        numeroLocal += 10; // Modifica apenas numeroLocal
        return (numeroLocal, _numero); 
    }

    // Função para demonstrar Reference Type
    function demonstrarReferenceType(Pessoa memory _pessoa) public pure returns (Pessoa memory) {
        Pessoa memory _pessoa2 = _pessoa;
        _pessoa2.idade += 1;
        return _pessoa; 
    }
}