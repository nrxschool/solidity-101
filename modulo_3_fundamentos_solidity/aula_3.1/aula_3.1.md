**Aula 3.1: Solidity: Pensando Diferente**

**Objetivo:** Introduzir a linguagem Solidity e seus paradigmas, comparando-a com linguagens de programação tradicionais e explorando a filosofia da orientação a contratos.

**Conteúdo:**

- **Solidity: Uma Nova Perspectiva:**
    - Solidity é uma linguagem de programação criada especificamente para o desenvolvimento de contratos inteligentes na blockchain Ethereum.
    - Apresenta paradigmas distintos em comparação às linguagens de programação tradicionais, exigindo uma mudança de perspectiva dos desenvolvedores.
    - A precisão e a prevenção de erros são cruciais em Solidity, dado o ambiente de execução imutável e de alto valor da blockchain.

- **Comparando Contratos com Programas Tradicionais:**
    - Embora compartilhem semelhanças com programas tradicionais, os contratos inteligentes possuem diferenças fundamentais:

        | Característica          | Programas Tradicionais                        | Contratos Inteligentes                                  |
        |--------------------------|-----------------------------------------------|----------------------------------------------------------|
        | Execução              | Centralizada                                  | Descentralizada                                       |
        | Estado                 | Memória volátil                               | Persistente na blockchain                             |
        | Interação Externa      | APIs, bibliotecas                             | Transações                                             |
        | Ambiente de Execução | Sistemas operacionais, servidores, nuvem     | Ethereum Virtual Machine (EVM)                       |
        | Imutabilidade          | Código pode ser alterado e atualizado        | Código imutável após implantação                      |
        | Armazenamento de Dados | Bancos de dados, arquivos, etc.              | Armazenamento de estado na blockchain                 |
        | Segurança              | Práticas de codificação, firewalls, etc.     | Auditorias, programação defensiva, bibliotecas seguras |
        | Custos de Execução    | Uso de recursos computacionais e armazenamento | Gas na rede Ethereum                                   |

- **A Filosofia da Orientação a Contratos:**
    - **Encapsulamento:**
        - Os contratos inteligentes encapsulam seus dados e lógica interna.
        - Em Solidity, o encapsulamento é alcançado através de modificadores de acesso (public, private, internal, external) e funções.

    - **Herança:**
        - A herança permite criar novos contratos a partir de contratos existentes, herdando suas propriedades e comportamentos.
        - A herança promove a reusabilidade de código e facilita a criação de contratos complexos a partir de blocos de construção mais simples.
        - Em Solidity, a herança é implementada com a palavra-chave `is`, permitindo que um contrato herde de um ou mais contratos pai.

    - **Polimorfismo:**
        - O polimorfismo permite que funções com o mesmo nome tenham comportamentos diferentes em diferentes contratos.
        - Isso aumenta a flexibilidade e a capacidade de adaptação dos contratos inteligentes.
        - Em Solidity, o polimorfismo é implementado através de funções virtuais e da palavra-chave `override`, permitindo que contratos filhos modifiquem o comportamento de funções herdadas.
