# Aula 5: **Testes Unitários com Hardhat**

## Abertura

Bem-vindo à Aula 5! Hoje, vamos aprender como escrever **testes unitários** para contratos Solidity usando o **Hardhat**. Testes unitários são essenciais para garantir que o contrato funcione como esperado, evitando erros e vulnerabilidades antes do deploy. 

### Programação:

1. Testes Unitários
2. Escrevendo Testes com Hardhat

---

## 1. Testes Unitários

### O que são Testes Unitários?

- **Definição**: Testes que verificam o comportamento de pequenas unidades de código, geralmente funções.
- **Importância**:
  - **Confiabilidade**: Garantem que o contrato funciona corretamente.
  - **Detecção Precoce de Erros**: Identificam falhas antes do deploy.
  - **Facilidade de Manutenção**: Facilitam refatorações, já que erros serão rapidamente detectados.
  - **Documentação**: Servem como documentação sobre o funcionamento do contrato.


---

## 2. Escrevendo Testes com Hardhat

### Como Escrever Testes no Hardhat

- **Framework de Teste**: Hardhat usa o **Mocha** para estruturar os testes e **Chai** para asserções.
- **Estrutura de Pastas**: Os arquivos de teste ficam na pasta `test/`.
- **Organização dos Testes**:
  - **describe**: Bloco que agrupa testes relacionados a um contrato ou função específica.
  - **it**: Define testes individuais para uma função ou comportamento específico.
  - **expect**: Usado para fazer asserções sobre o resultado das funções, garantindo que retornem o valor esperado.

---

## Conclusão

Nesta aula, aprendemos a importância dos **testes unitários**  no desenvolvimento de contratos inteligentes. Vimos como o Hardhat facilita a criação e organização de testes, permitindo uma abordagem estruturada e segura para o desenvolvimento de contratos. Com essas práticas, você pode construir contratos inteligentes mais robustos e confiáveis.

---

## Recapitulação

1. **Testes Unitários**: Garantem que cada função do contrato funcione corretamente.
3. **Escrevendo Testes no Hardhat**: Estrutura de testes usando Mocha e Chai com Hardhat.

---

## Lição de Casa

Crie um contrato simples que possui uma função que retorna um valor constante. Escreva testes unitários para verificar se o valor retornado é o esperado e experimente aplicar o ciclo de TDD para a implementação.

---

## Próximo Módulo

No próximo módulo, vamos fazer projetos práticos.

---