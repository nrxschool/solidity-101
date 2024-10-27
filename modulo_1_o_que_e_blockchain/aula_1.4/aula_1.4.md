## Aula 1.4: Criptografia Essencial, Chaves Públicas e Privadas, e Assinaturas Digitais

**Objetivo:** Introduzir os conceitos básicos de criptografia e como eles se aplicam à segurança das wallets na blockchain.

**Conteúdo:**

- **Criptografia Essencial:**
    - O que é criptografia?
        - Criptografia simétrica vs. assimétrica
        - Funções hash
    - Por que a criptografia é importante na blockchain?
        - Confidencialidade: garante que apenas pessoas autorizadas acessem as informações.
        - Integridade: garante que as informações não foram alteradas.
        - Autenticidade: verifica a identidade do remetente.
        - Não-repudiação: impede que alguém negue ter enviado uma mensagem.

- **Chaves Públicas e Privadas: A Base da Segurança:**
    - O que são chaves públicas e privadas?
        - Analogia com caixa de correio (chave pública) e chave para abrir a caixa (chave privada)
    - Como as chaves são geradas?
        - Algoritmos criptográficos (ex: RSA, ECC)
    - Endereços: derivados da chave pública
    - Hash:
        Funções hash: geram uma "impressão digital" única de dados de qualquer tamanho.
        Características:
            Determinística: a mesma entrada sempre produz a mesma saída.
            Unidirecional: não é possível obter a entrada a partir da saída.
            Sensível a alterações: qualquer mudança na entrada altera a saída.
- **Assinaturas Digitais: Como Funcionam?**
    - O que é uma assinatura digital?
    - Como as assinaturas digitais são criadas?
        - Assinatura = Mensagem criptografado com a chave privada
    - Como as assinaturas digitais são verificadas?
        - Verificação = Descriptografar a assinatura com a chave pública e comparar com o hash da mensagem original