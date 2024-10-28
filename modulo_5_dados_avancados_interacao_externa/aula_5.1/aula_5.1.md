## Aula 5.1: Tipos de Dados Complexos e Structs

**Objetivo:** Aprender a utilizar structs em Solidity para organizar e representar dados de forma estruturada dentro de contratos inteligentes.

**Conteúdo:**

- **Tipos de Dados Complexos:**
    - Solidity oferece tipos de dados complexos para representar estruturas de dados mais elaboradas.
    - `structs`: permitem agrupar diferentes tipos de dados em uma única unidade.
    - `arrays`: coleções ordenadas de elementos do mesmo tipo.
    - `mappings`: estruturas de dados chave-valor.

- **Structs: Organizando seus Dados:**
    - Definição: Uma `struct` é uma estrutura que permite agrupar variáveis de diferentes tipos sob um único nome.
    - Sintaxe:

    ```solidity
    struct NomeDaStruct {
        tipo variavel1;
        tipo variavel2;
        // ... mais variáveis
    }
    ```

    - Exemplo:

    ```solidity
    struct Produto {
        string nome;
        uint256 preco;
        bool disponivel;
    }
    ```

- **Declarando Variáveis do Tipo Struct:**

    ```solidity
    Produto public meuProduto;
    ```

- **Acessando Membros da Struct:**
    - Operador ponto (`.`): `meuProduto.nome`

- **Utilizando Structs em Funções:**
    - Passando structs como parâmetros
    - Retornando structs de funções

- **Exemplo de Uso:**

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.27;

    contract Loja {
        struct Produto {
            string nome;
            uint256 preco;
            bool disponivel;
        }

        Produto public produto;

        function adicionarProduto(string memory _nome, uint256 _preco) public {
            produto = Produto(_nome, _preco, true);
        }
    }

    Produto memory produto1 = Produto("Camiseta", 10, true);
    Produto memory produto2 = produto1; // Cópia da struct

    produto2.nome = "Calça"; // Modifica a string na referência

    // produto1.nome também será "Calça" porque ambos apontam para os mesmos dados.

    ```

### Tipos por Valor x Tipos por Referência

Em Solidity, os tipos de dados são divididos em duas categorias principais:

    1. Value Types (Tipos por Valor):
       - Armazenados diretamente na variável.
       - Passados por cópia em atribuições e passagem de parâmetros.
       - Modificar uma cópia não afeta o original.
       - Exemplos: boolean, uint, int, address, bytes (até 31 bytes), enums.

    2. Reference Types (Tipos por Referência):
       - Armazenam um ponteiro para os dados, não os dados em si.
       - Passados por referência em atribuições e passagem de parâmetros.
       - Modificar uma referência afeta o dado original.
       - Exemplos: arrays, structs, mappings, strings, bytes (32 bytes ou mais).
