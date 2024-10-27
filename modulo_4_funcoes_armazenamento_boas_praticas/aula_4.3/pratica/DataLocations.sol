// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract LocaisDeDados {

    // Array dinâmico de inteiros sem sinal. Armazenado no storage.
    uint256[] public numeros;

    // Mapping de IDs de usuários para seus respectivos endereços. Armazenado no storage.
    mapping(uint256 => address) public usuarioPorId;

    // Definição de uma estrutura chamada DadosDoProduto.
    struct DadosDoProduto {
        uint256 preco;
        string nome;
    }

    // Mapping de IDs de produtos para seus respectivos dados (DadosDoProduto). Armazenado no storage.
    mapping(uint256 => DadosDoProduto) public dadosDoProdutoPorId;

    // Função pública que demonstra diferentes locais de dados.
    function demonstrarLocaisDeDados() public {
        // Chama a função interna _modificarDadosNoStorage, passando variáveis de estado como argumentos.
        _modificarDadosNoStorage(numeros, usuarioPorId, dadosDoProdutoPorId[1]);

        // Acessando os dados de um produto dentro do mapping 'dadosDoProdutoPorId' no storage.
        // Usamos 'storage' para indicar que 'dadosProduto' é uma referência à struct armazenada no mapping.
        DadosDoProduto storage dadosProduto = dadosDoProdutoPorId[1];

        // Criando uma nova struct na memória para representar dados de um produto temporário.
        // Usamos 'memory' para indicar que 'dadosProdutoTemporario' é uma cópia 
        // da struct criada na memória e não afeta o storage.
        DadosDoProduto memory dadosProdutoTemporario = DadosDoProduto(0, "");

        // Modificando o preço do produto diretamente no storage.
        dadosProduto.preco = 1000; 

        // Modificando o nome do produto na variável da memória.
        dadosProdutoTemporario.nome = "Produto Exemplo"; 

        // A mudança em 'dadosProdutoTemporario' não afeta 'dadosProduto' no storage.
    }

    // Função interna que recebe argumentos com seus locais de dados especificados.
    function _modificarDadosNoStorage(
        uint256[] storage _numeros, // _numeros é uma referência para um array no storage.
        mapping(uint256 => address) storage _usuarioPorId, // _usuarioPorId é uma referência para um mapping no storage.
        DadosDoProduto storage _dadosDoProduto // _dadosDoProduto é uma referência para uma struct no storage.
    ) internal {
        // Modificar _numeros, _usuarioPorId ou _dadosDoProduto dentro desta função irá afetar diretamente os dados no storage.
        // 1. Adicionar um número ao array `_numeros`
        _numeros.push(123);

        // 2. Adicionar um usuário ao mapping `_usuarioPorId`
        _usuarioPorId[1] = msg.sender;

        // 3. Modificar o preço do produto na struct `_dadosDoProduto`
        _dadosDoProduto.preco = 500;
    }

    // Função que demonstra a devolução de uma variável de memória.
    function obterArrayDeNumeros(uint256[] memory _numeros) public pure returns (uint256[] memory) {
        // _numeros é um array alocado na memória. 
        // Modificá-lo aqui não afeta nenhuma variável no storage.

        // Retorna um novo array alocado na memória.
        return _numeros; 
    }

    // Função que demonstra o uso de calldata.
    // Calldata é um local de dados especial, somente leitura, 
    // para dados de entrada de função. É mais eficiente em termos de gás do que memory.
    function processarDadosDeEntrada(uint256[] calldata _dados) external pure returns(uint256) {
        // _dados é um array somente leitura passado como calldata.
        // Não podemos modificar _dados dentro desta função.
        uint256 soma = 0;
        for (uint256 i = 0; i < _dados.length; i++) {
            soma += _dados[i];
        }
        return soma;
    }
}
