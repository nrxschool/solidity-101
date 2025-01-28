# Aula 2: **Eventos: Notificando o Mundo Exterior**

## Abertura

Olá! Bem-vindo à Aula 2 do nosso curso de Solidity para iniciantes. Na aula anterior, exploramos as funções em Solidity, aprendendo como declará-las, utilizá-las e a importância dos modificadores de visibilidade. Hoje, vamos nos aprofundar em um recurso poderoso de Solidity: os **eventos**.

Os eventos são fundamentais para a comunicação entre contratos inteligentes e o mundo exterior. Eles permitem que contratos inteligentes emitam informações que podem ser capturadas por aplicações externas, como interfaces de usuário ou outros sistemas. Nesta aula, aprenderemos o que são eventos, como declará-los, como emiti-los e como aplicações externas podem escutá-los.

### Programação:

1. O que são Eventos em Solidity?
2. Declarando Eventos
3. Emitindo Eventos
4. Escutando Eventos Externamente
5. Boas Práticas com Eventos

---

## 1. O que são Eventos em Solidity?

### Definição

- **Eventos** são mecanismos em Solidity que permitem que um contrato inteligente **registre informações** na blockchain.
- Eles são armazenados nos **logs** da transação, que são uma estrutura de dados especial na blockchain do Ethereum.
- Esses logs não são acessíveis pelos contratos inteligentes, mas podem ser escutados por **aplicações externas**, como interfaces de usuário ou serviços de backend.

### Por que usar Eventos?

- **Comunicação com o Mundo Exterior**: Eventos permitem que contratos inteligentes enviem informações para fora da blockchain.
- **Eficiência**: Registrar informações através de eventos é mais econômico em termos de gás do que armazenar dados em variáveis de estado.
- **Monitoramento**: Aplicações podem monitorar contratos em tempo real, reagindo a eventos específicos.
- **Transparência**: Fornecem um histórico público de ações importantes dentro do contrato.

---

## 2. Declarando Eventos

Para utilizar eventos em Solidity, primeiro precisamos declará-los dentro do contrato.

### Sintaxe Básica

```solidity
event NomeDoEvento(tipoParametro nomeParametro, ...);
```

- **`event`**: Palavra-chave que indica a declaração de um evento.
- **`NomeDoEvento`**: Identificador único do evento.
- **Parâmetros**: Lista de tipos e nomes de parâmetros que serão registrados com o evento.

### Exemplo de Declaração

```solidity
event Transferencia(address indexed de, address indexed para, uint256 valor);
```

- **Descrição**: Declara um evento chamado `Transferencia` que registra o endereço de origem (`de`), o endereço de destino (`para`) e o valor transferido (`valor`).
- **`indexed`**: Modificador que permite filtrar eventos por esses parâmetros ao escutá-los externamente (até três parâmetros podem ser indexados).

### Observações sobre `indexed`

- Parâmetros marcados como `indexed` permitem que aplicações externas filtrem e pesquisem eventos específicos com base nesses valores.
- Apenas tipos de dados simples podem ser indexados (e.g., `address`, `uint`, `bytes32`).

---

## 3. Emitindo Eventos

Uma vez que um evento é declarado, podemos emiti-lo em qualquer lugar dentro das funções do contrato.

### Sintaxe para Emitir Eventos

```solidity
emit NomeDoEvento(valorParametro1, valorParametro2, ...);
```

- **`emit`**: Palavra-chave usada para emitir um evento.
- **`NomeDoEvento`**: Nome do evento declarado anteriormente.
- **Parâmetros**: Valores que correspondem aos parâmetros do evento.

### Exemplo de Emissão

```solidity
function transferir(address _para, uint256 _valor) public {
    require(saldos[msg.sender] >= _valor, "Saldo insuficiente.");

    saldos[msg.sender] -= _valor;
    saldos[_para] += _valor;

    emit Transferencia(msg.sender, _para, _valor);
}
```

- **Descrição**: Após realizar a transferência de fundos, o contrato emite o evento `Transferencia` com os detalhes da transação.

---

## 4. Escutando Eventos Externamente

Embora contratos inteligentes não possam acessar eventos, aplicações externas podem escutá-los e reagir a eles.

### Como Escutar Eventos

- **Bibliotecas**: Ferramentas como **Web3.js**, **Ethers.js** ou **Web3.py** permitem que aplicações interajam com a blockchain Ethereum e escutem eventos.
- **Filtragem**: Aplicações podem filtrar eventos com base em parâmetros indexados.
- **Monitoramento em Tempo Real**: É possível configurar listeners que reagem imediatamente quando um evento é emitido.

### Exemplo com Web3.js

```javascript
const contrato = new web3.eth.Contract(abi, enderecoContrato);

contrato.events.Transferencia({
    filter: { de: contaEspecifica }, // Opcional: filtrar por endereço específico
    fromBlock: 'latest'
}, function(error, event) {
    if (error) {
        console.error(error);
    } else {
        console.log("Evento capturado:", event);
        // Reagir ao evento, atualizar interface, etc.
    }
});
```

- **Descrição**: O código acima configura um listener para o evento `Transferencia`, filtrando opcionalmente por um endereço específico.

### Importância para Aplicações

- **Interatividade**: Permite que interfaces de usuário atualizem informações em tempo real.
- **Notificações**: Aplicações podem notificar usuários sobre eventos relevantes.
- **Integridade**: Garante que dados apresentados aos usuários refletem o estado atual da blockchain.

---

## Conclusão

Nesta aula, exploramos o conceito de **eventos em Solidity**, entendendo como eles são fundamentais para a comunicação entre contratos inteligentes e o mundo exterior. Aprendemos a declarar e emitir eventos dentro de nossos contratos, e vimos como aplicações externas podem escutar esses eventos para reagir a mudanças na blockchain.

Os eventos são uma ferramenta poderosa para criar aplicações descentralizadas interativas e responsivas, permitindo que usuários e sistemas acompanhem em tempo real as ações ocorrendo nos contratos inteligentes.

---

## Recapitulação

1. **O que são Eventos em Solidity**: Mecanismos para registrar informações na blockchain, comunicando-se com aplicações externas.
2. **Declarando Eventos**: Usando a palavra-chave `event` seguida do nome e parâmetros.
3. **Emitindo Eventos**: Utilizando `emit` dentro das funções do contrato para registrar eventos.
4. **Escutando Eventos Externamente**: Aplicações usam bibliotecas como Web3.js para monitorar e reagir a eventos.

---

## Lição de Casa

Desenvolva um contrato chamado `Mercado` que permita que usuários comprem e vendam itens. Emita eventos para quando um item for listado, vendido ou removido do mercado. Certifique-se de indexar parâmetros relevantes para facilitar a filtragem.

---

## Próxima Aula

Na próxima aula, exploraremos o conceito de **armazenamento de dados** em Solidity.

---