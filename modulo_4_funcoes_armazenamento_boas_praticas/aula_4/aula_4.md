# Aula 4: **Escrevendo Código Seguro**

## Abertura

Olá! Bem-vindo à Aula 4.4 do nosso curso de Solidity para iniciantes. Nas aulas anteriores, exploramos funções, eventos e outras funcionalidades importantes de Solidity. Hoje, vamos focar em um aspecto crucial no desenvolvimento de contratos inteligentes: **Escrever Código Seguro**.

Erros em contratos inteligentes podem ter consequências graves, incluindo a perda de fundos, vulnerabilidades de segurança e danos à reputação. Nesta aula, aprenderemos técnicas para aumentar a segurança dos seus contratos, incluindo validação de entrada, tratamento de erros e o uso de modificadores. Compreender e aplicar essas práticas é essencial para desenvolver contratos robustos e confiáveis na rede Ethereum.

### Conteúdo:

1. Escrevendo Código Seguro
2. Validação e Tratamento de Erros
3. Modificadores

---

## 1. Escrevendo Código Seguro

### Importância da Segurança em Contratos Inteligentes

- **Consequências de Erros**:
  - **Perda de Fundos**: Contratos com erros podem permitir que atacantes roubem ou bloqueiem fundos.
  - **Falhas de Segurança**: Vulnerabilidades podem ser exploradas para alterar o comportamento do contrato.
  - **Danos à Reputação**: Erros podem minar a confiança dos usuários e da comunidade.

### Técnicas para Aumentar a Segurança

- **Validação de Entrada**: Verificar cuidadosamente os dados fornecidos pelos usuários.
- **Tratamento de Erros**: Lidar adequadamente com condições inesperadas ou exceções.
- **Uso de Modificadores**: Reutilizar lógica comum para validação e controle de acesso.
- **Auditorias de Código**: Revisar o código para identificar e corrigir vulnerabilidades.
- **Boas Práticas de Programação**: Seguir padrões reconhecidos para escrever código claro e seguro.

---

## 2. Validação e Tratamento de Erros

A validação de entrada e o tratamento de erros são fundamentais para evitar comportamentos indesejados em contratos inteligentes.

### 2.1 `require`

- **Descrição**: Verifica se uma condição é verdadeira. Se não for, reverte a transação com uma mensagem de erro.
- **Uso Comum**:
  - Validar parâmetros de função.
  - Garantir que certas condições prévias sejam atendidas.
- **Sintaxe**:

  ```solidity
  require(condicao, "Mensagem de erro");
  ```

- **Exemplo**:

  ```solidity
  function transferir(address _destinatario, uint _valor) public {
      require(saldo[msg.sender] >= _valor, "Saldo insuficiente.");
      saldo[msg.sender] -= _valor;
      saldo[_destinatario] += _valor;
  }
  ```

### 2.2 `assert`

- **Descrição**: Verifica se uma condição é verdadeira. Se não for, causa um erro irrecuperável (panic) e consome todo o gás restante.
- **Uso Comum**:
  - Detectar erros internos e condições que nunca deveriam ocorrer.
  - Garantir invariantes do contrato.
- **Sintaxe**:

  ```solidity
  assert(condicao);
  ```

- **Exemplo**:

  ```solidity
  function incrementarContador() public {
      contador += 1;
      assert(contador > 0); // O contador nunca deve ser negativo
  }
  ```

- **Nota**: `assert` deve ser usado com cuidado, pois consome todo o gás da transação quando falha.

### 2.3 `revert`

- **Descrição**: Reverte a transação imediatamente, opcionalmente com uma mensagem de erro.
- **Uso Comum**:
  - Quando múltiplas condições precisam ser verificadas.
  - Para simplificar a leitura do código.
- **Sintaxe**:

  ```solidity
  revert("Mensagem de erro");
  ```

- **Exemplo**:

  ```solidity
  function comprar(uint _quantidade) public payable {
      if (_quantidade > estoque) {
          revert("Quantidade solicitada excede o estoque disponível.");
      }
      // Processar a compra
  }
  ```

### 2.4 `try/catch`

- **Descrição**: Permite capturar e tratar erros em chamadas externas a outros contratos.
- **Uso Comum**:
  - Gerenciar exceções ao interagir com outros contratos.
  - Implementar lógica alternativa em caso de falha.
- **Sintaxe**:

  ```solidity
  try contratoExterno.funcao() {
      // Sucesso
  } catch {
      // Falha
  }
  ```

- **Exemplo**:

  ```solidity
  function chamarContratoExterno(address _enderecoContrato) public {
      ContratoExterno contrato = ContratoExterno(_enderecoContrato);
      try contrato.funcaoExterna() {
          // Chamada bem-sucedida
      } catch {
          // Tratar a falha
          revert("Falha ao chamar o contrato externo.");
      }
  }
  ```

---

## 3. Modificadores

Modificadores são blocos de código que alteram o comportamento de funções, permitindo adicionar lógica antes e/ou depois da execução da função alvo.

### 3.1 O que são Modificadores?

- **Definição**: Funções que modificam o comportamento de outras funções.
- **Uso**:
  - **Validar Entrada**: Verificar condições antes de executar a função.
  - **Controlar Acesso**: Restringir quem pode chamar a função.
  - **Reutilizar Código**: Evitar repetição de código em múltiplas funções.

### 3.2 Sintaxe de um Modificador

```solidity
modifier nomeDoModificador() {
    // Código a ser executado antes
    _;
    // Código a ser executado depois (opcional)
}
```

- **`_`**: Representa o ponto onde o corpo da função modificada será inserido.

### 3.3 Exemplos

#### Exemplo 1: Modificador `onlyOwner` para Controle de Acesso

```solidity
contract MeuContrato {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Apenas o proprietário pode chamar esta função.");
        _;
    }

    function funcaoRestrita() public onlyOwner {
        // Código que apenas o proprietário pode executar
    }
}
```

- **Descrição**:
  - O modificador `onlyOwner` verifica se `msg.sender` é o proprietário.
  - Se a condição não for atendida, a transação é revertida.
  - A função `funcaoRestrita` só pode ser executada pelo proprietário.

#### Exemplo 2: Modificador para Validar Entrada

```solidity
modifier valorMinimo(uint _valorMinimo) {
    require(msg.value >= _valorMinimo, "Valor insuficiente.");
    _;
}

function comprar() public payable valorMinimo(1 ether) {
    // Processar a compra
}
```

- **Descrição**:
  - O modificador `valorMinimo` verifica se `msg.value` é maior ou igual ao valor mínimo especificado.
  - A função `comprar` só será executada se a condição for atendida.

---

## Conclusão

Nesta aula, abordamos a importância de escrever código seguro em Solidity. Aprendemos sobre técnicas essenciais como validação de entrada, tratamento de erros e uso de modificadores para controlar o fluxo e acesso às funções. Compreender e aplicar essas práticas é fundamental para o desenvolvimento de contratos inteligentes seguros e confiáveis.

Escrever código seguro não é apenas uma recomendação, mas uma necessidade no desenvolvimento de contratos inteligentes. A responsabilidade de proteger os fundos e dados dos usuários é primordial, e a aplicação dessas técnicas é um passo fundamental nessa direção.

---

## Recapitulação

1. **Escrevendo Código Seguro**:
   - A importância de prevenir erros e vulnerabilidades em contratos inteligentes.
   - Técnicas para aumentar a segurança, incluindo validação de entrada, tratamento de erros e uso de modificadores.
2. **Validação e Tratamento de Erros**:
   - Uso de `require`, `assert`, `revert` e `try/catch` para validar condições e lidar com exceções.
3. **Modificadores**:
   - Criação de modificadores para validar entrada, controlar acesso e reutilizar código.
   - Sintaxe e exemplos de uso de modificadores.

---

## Lição de Casa
 Crie um contrato chamado `RegistroSeguro` que permite que usuários armazenem uma mensagem. Use `require` para validar que a mensagem não está vazia.

---

## Próximo módulo

No próximo módulo vamos falar de estruturas de dados avançadas e interações externas no solidity

---