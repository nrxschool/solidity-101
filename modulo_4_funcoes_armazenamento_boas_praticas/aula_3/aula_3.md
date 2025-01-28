# Aula 3: Armazenamento de Dados: Memory, Calldata e Storage

## Abertura

Bem-vindo à Aula 3! Hoje vamos explorar os diferentes tipos de armazenamento de dados em Solidity: **memory**, **calldata** e **storage**. Entender onde e como armazenar dados é essencial para otimizar o desempenho e a eficiência dos contratos inteligentes.

### Programação:

1. Onde seus Dados Residem?
2. Storage
3. Memory
4. Calldata

---

## 1. Onde seus Dados Residem?

Solidity oferece três locais para armazenar dados:

- **Storage:** Armazenamento persistente na blockchain.
  > É a localização de dados padrão para **variáveis de estado** (variáveis declaradas **fora de funções e dentro do escopo do contrato**). O armazenamento é persistente e **caro em termos de consumo de gás** para **modificar ou interagir com ele**. As variáveis de armazenamento são armazenadas no estado do contrato e sobrevivem a chamadas de função e transações. São armazenadas no espaço de storage, no blockchain, associado a um endereço de contrato. Cada nó terá uma cópia de tudo que é armazenado no storage.

- **Memory:** Armazenamento temporário em memória.
  > É uma área de armazenamento temporária e mais barata que **`storage`**. Variáveis na memória são armazenadas apenas durante a execução de uma função e são apagadas após a função retornar. Usadas em variáveis locais de funções que não são de estado, são armazenadas na memória por padrão. Você pode **especificar explicitamente a localização de dados como `memory` para parâmetros e variáveis de retorno de função.**

- **Calldata:** Espaço de memória temporário e não modificável para parâmetros de funções externas.
  > É uma área de armazenamento **imutável** e específica para os **dados de entrada (argumentos) de uma função chamada externamente ao contrato**. O calldata é usado quando uma função é chamada externamente ao contrato, como quando um usuário interage com o contrato por meio de uma transação. Os dados do calldata são gravados no blockchain como parte da transação, mas não são armazenados permanentemente no contrato. É mais barato em termos de gás do que **`memory`**, pois é apenas para leitura e não permite modificações.

A escolha do local de armazenamento impacta:
- Custo de gás
- Visibilidade dos dados
- Persistência dos dados

---

## 2. Storage

- Local de armazenamento **permanente** na blockchain.
- Usado para variáveis de estado do contrato.
- **Custo alto de escrita**, mas leitura mais barata.
- Dados persistem entre chamadas de funções.

Exemplo:

```solidity
contract MeuContrato {
    uint public meuNumero; // Armazenado em storage
}
```

---

## 3. Memory

- Local de armazenamento **temporário** na memória.
- Usado para variáveis locais dentro de funções.
- **Mais barato que storage**, tanto para leitura quanto para escrita.
- Dados são apagados após a execução da função.

Exemplo:

```solidity
function minhaFuncao(uint _numero) public pure returns (uint) {
    uint novoNumero = _numero * 2; // Armazenado em memory
    return novoNumero;
}
```

---

## 4. Calldata

- Local de armazenamento **temporário** e **não modificável**.
- Usado para parâmetros de funções externas.
- Semelhante à memory em termos de custo.
- Impede modificações acidentais dos dados de entrada.

Exemplo:

```solidity
function minhaFuncao(uint[] calldata _numeros) public pure returns (uint) {
    // ...
}
```

---

## Conclusão

Nesta aula, exploramos os diferentes locais de armazenamento em Solidity: **storage**, **memory** e **calldata**. Cada um tem suas características e impacto em termos de persistência e custo de gás. A escolha correta para cada tipo de dado ajuda a otimizar o contrato para desempenho e custo.

## Recapitulação

1. **Onde seus Dados Residem?** - Diferentes opções de armazenamento em Solidity.
2. **Storage** - Armazenamento permanente e caro para variáveis de estado.
3. **Memory** - Armazenamento temporário e barato dentro de funções.
4. **Calldata** - Armazenamento temporário e imutável para parâmetros de funções externas.

## Lição de Casa

- Explore e experimente usar `memory` e `calldata` em diferentes tipos de funções para entender como eles impactam o custo de gás.
- Teste modificações de variáveis em storage e memory para observar as diferenças de persistência entre chamadas de função.

## Próxima Aula

Na próxima aula, vamos aprender a escrever **código seguro em Solidity**. Nos vemos lá!