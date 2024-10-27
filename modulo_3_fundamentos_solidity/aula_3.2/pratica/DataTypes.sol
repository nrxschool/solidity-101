// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DataTypes {
    // Booleano
    bool isAtivo = true; 
    // Ocupa 1 byte de armazenamento. 
    // Em baixo nível, true é representado por 0x01 e false por 0x00.

    // Inteiros
    int meuInteiro = -10; 
    uint meuInteiroSemSinal = 255; 
    // int: Inteiros com sinal, ou seja, podem representar valores positivos e negativos. Em Solidity, por padrão, int é int256, ocupando 256 bits (32 bytes) e variando de -2^255 a 2^255 - 1.
    // uint: Inteiros sem sinal, ou seja, só representam valores positivos. O padrão é uint256, ocupando 256 bits e variando de 0 a 2^256 - 1.


    // Ponto flutuante (experimental)
    // fixed meuFixed = 3.14159; 
    // `fixed` e `ufixed` são tipos experimentais para representar números decimais. 
    // Eles não são recomendados para uso em produção devido à sua precisão limitada e à possibilidade de erros de arredondamento.
    // ufixed meuUfixed = 1.2345; 
    // Similar a `fixed`, mas armazena apenas números não negativos.

    // Endereço
    address meuEndereco = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    // address: Tipo para armazenar um endereço Ethereum (20 bytes ou 160 bits), que representa a identidade única de uma conta ou contrato.
    address payable meuEnderecoPagavel = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); 
    // address payable: Versão de address que permite transferências de Ether, necessário para enviar fundos diretamente para um endereço.


    // Bytes
    bytes1 meuByte = 0x42; 
    // bytes1 a bytes32: Tipos de bytes de tamanho fixo, com bytes32 sendo o maior. Esses tipos são otimizados para armazenamento eficiente de dados binários e ocupam 1 a 32 bytes respectivamente. Eles são ideais para guardar identificadores de hash, como bytes32 para hashes SHA-256.
    // Os bytes são imutáveis e armazenados diretamente em armazenamento ou memória, o que facilita o acesso e a manipulação binária.


    // String
    string minhaString = "Ola mundo!"; 
    // Armazena uma sequência de caracteres. 
    // O tamanho da string é dinâmico e não há limite para o número de caracteres que ela pode conter. 
    // Strings são armazenadas como arrays de bytes, com cada caractere ocupando 2 bytes.
}
