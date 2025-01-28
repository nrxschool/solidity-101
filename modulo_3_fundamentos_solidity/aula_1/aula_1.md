# Aula 1: **Solidity: Pensando Diferente**

## Abertura

Olá! Bem-vindo à aula 3.1 do nosso curso de Solidity para iniciantes. Até agora, exploramos os fundamentos da blockchain, contratos inteligentes e criamos nossa primeira wallet. Hoje, vamos mergulhar na linguagem Solidity e entender como ela difere das linguagens de programação tradicionais. Vamos descobrir como pensar de forma diferente ao programar contratos inteligentes e explorar a filosofia da orientação a contratos. Vamos lá!

### Programação:

1. Solidity: Uma Nova Perspectiva
2. Comparando Contratos com Programas Tradicionais
3. A Filosofia da Orientação a Contratos
4. Encapsulamento, Herança e Polimorfismo em Solidity

---

## 1. Solidity: Uma Nova Perspectiva

Solidity é uma linguagem de programação criada especificamente para o desenvolvimento de contratos inteligentes na blockchain Ethereum. Ela apresenta paradigmas distintos em comparação às linguagens de programação tradicionais, exigindo uma mudança de perspectiva dos desenvolvedores.

### Características de Solidity:

- **Orientada a Contratos**: Foca em contratos inteligentes como unidades fundamentais de código.
- **Precisão e Prevenção de Erros**: Devido ao ambiente imutável da blockchain, erros podem ser custosos e irreversíveis.
- **Execução Descentralizada**: O código é executado em um ambiente distribuído, a Ethereum Virtual Machine (EVM).
- **Custo de Execução (Gas)**: Cada operação tem um custo associado, incentivando a escrita de código otimizado.

### Mudança de Perspectiva:

- **Imutabilidade**: Diferente de aplicações tradicionais, uma vez implantado, o código do contrato inteligente não pode ser alterado.
- **Transações**: A interação com contratos é feita através de transações que alteram o estado da blockchain.
- **Segurança em Primeiro Lugar**: A proteção contra vulnerabilidades é crucial, já que contratos mal escritos podem levar a perdas financeiras significativas.

## 2. Comparando Contratos com Programas Tradicionais

Embora compartilhem semelhanças com programas tradicionais, os contratos inteligentes possuem diferenças fundamentais:

| Característica          | Programas Tradicionais                        | Contratos Inteligentes                                  |
|-------------------------|-----------------------------------------------|---------------------------------------------------------|
| **Execução**            | Centralizada                                  | Descentralizada                                         |
| **Estado**              | Memória volátil                               | Persistente na blockchain                               |
| **Interação Externa**   | APIs, bibliotecas                             | Transações                                              |
| **Ambiente de Execução**| Sistemas operacionais, servidores, nuvem      | Ethereum Virtual Machine (EVM)                          |
| **Imutabilidade**       | Código pode ser alterado e atualizado         | Código imutável após implantação                        |
| **Armazenamento de Dados**| Bancos de dados, arquivos, etc.            | Armazenamento de estado na blockchain                   |
| **Segurança**           | Práticas de codificação, firewalls, etc.      | Auditorias, programação defensiva, bibliotecas seguras  |
| **Custos de Execução**  | Uso de recursos computacionais e armazenamento| Gas na rede Ethereum                                    |

## 3. A Filosofia da Orientação a Contratos

A programação em Solidity segue a filosofia da orientação a contratos, que compartilha conceitos com a programação orientada a objetos, mas com adaptações específicas para o ambiente de contratos inteligentes.

### Encapsulamento:

- **Definição**: Agrupar dados e funções que operam sobre esses dados dentro de um contrato.
- **Em Solidity**:
  - **Funções**: São usadas para interagir com os dados do contrato de forma controlada.

### Herança:

- **Definição**: Permite que um contrato herde propriedades e métodos de outro contrato.

### Polimorfismo:

- **Definição**: Habilidade de diferentes contratos implementarem funções com o mesmo nome, mas comportamentos diferentes.

## 4. Encapsulamento, Herança e Polimorfismo em Solidity

### Encapsulamento em Prática:

```solidity
pragma solidity ^0.8.0;

contract Caixa {
    uint private saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}
```

- **Análise**:
  - **Variável `saldo`**: Declarada como `private`, só pode ser acessada dentro do contrato.
  - **Funções Públicas**: `depositar` e `consultarSaldo` permitem interagir com `saldo` de forma controlada.

### Herança em Prática:

```solidity
contract Caixa {
    uint private saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}

contract CaixaPremium is Caixa {
    function bonus() public {
        saldo += 100; // Acesso permitido pois `saldo` é `private` no contrato pai
    }
}
```

- **Nota**: O exemplo acima resultará em erro, pois `saldo` é `private` e não pode ser acessado por contratos filhos. Para permitir o acesso, `saldo` deve ser declarado como `protected` ou `internal`.

```solidity
contract Caixa {
    uint internal saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}

contract CaixaPremium is Caixa {
    function bonus() public {
        saldo += 100; // Agora é possível acessar `saldo` no contrato filho
    }
}
```

### Polimorfismo em Prática:

```solidity
contract Calculadora {
    function calcular(uint a, uint b) public pure virtual returns (uint) {
        return a + b;
    }
}

contract CalculadoraAvancada is Calculadora {
    function calcular(uint a, uint b) public pure override returns (uint) {
        return a * b;
    }
}
```

- **Análise**:
  - **Função `calcular`**: Declarada como `virtual` em `Calculadora` e `override` em `CalculadoraAvancada`.
  - **Comportamento Diferente**: `Calculadora` soma os números, enquanto `CalculadoraAvancada` os multiplica.

## Conclusão

Nesta aula, introduzimos a linguagem Solidity e seus paradigmas, comparando-a com linguagens de programação tradicionais. Exploramos como a filosofia da orientação a contratos difere da programação tradicional e como conceitos como encapsulamento, herança e polimorfismo são implementados em Solidity. Compreender essas diferenças é crucial para desenvolver contratos inteligentes seguros e eficientes.

## Recapitulação

1. **Solidity: Uma Nova Perspectiva**: Linguagem específica para contratos inteligentes, exigindo uma nova forma de pensar.
2. **Comparando Contratos com Programas Tradicionais**: Entendemos as principais diferenças e implicações.
3. **A Filosofia da Orientação a Contratos**: Exploramos conceitos-chave adaptados para contratos inteligentes.
4. **Encapsulamento, Herança e Polimorfismo em Solidity**: Vimos como esses conceitos são aplicados na prática.

## Lição de casa

Pesquise sobre os modificadores de acesso em Solidity e liste-os com uma breve descrição.

## Próxima aula

Na próxima aula, vamos falar dos tipos de dados no Solidity.