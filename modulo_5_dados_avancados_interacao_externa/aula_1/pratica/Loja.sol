// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Loja {

    // Definição da struct Produto
    struct Produto {
        uint256 id;
        string nome;
        uint256 preco;
        bool disponivel;
    }

    // Contador para gerar IDs únicos
    uint256 public contadorDeProdutos;

    // Mapping de IDs para Produtos
    mapping(uint256 => Produto) public produtos;

    // Evento para registrar a adição de um novo produto
    event ProdutoAdicionado(uint256 id, string nome, uint256 preco);

    // Função para adicionar um novo produto
    function adicionarProduto(string memory _nome, uint256 _preco) public {
        contadorDeProdutos++;
        produtos[contadorDeProdutos] = Produto(contadorDeProdutos, _nome, _preco, true);

        emit ProdutoAdicionado(contadorDeProdutos, _nome, _preco);
    }

    // Função para atualizar o preço de um produto
    function atualizarPreco(uint256 _id, uint256 _novoPreco) public {
        require(produtos[_id].id != 0, "Produto nao encontrado.");
        produtos[_id].preco = _novoPreco;
    }

    // Função para alterar a disponibilidade de um produto
    function alterarDisponibilidade(uint256 _id, bool _disponivel) public {
        require(produtos[_id].id != 0, "Produto nao encontrado.");
        produtos[_id].disponivel = _disponivel;
    }

    // Função para obter os detalhes de um produto
    function obterProduto(uint256 _id) public view returns (Produto memory) {
        require(produtos[_id].id != 0, "Produto nao encontrado.");
        return produtos[_id];
    }
}