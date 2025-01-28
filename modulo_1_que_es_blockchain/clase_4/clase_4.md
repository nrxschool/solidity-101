# Clase 4: **Cuentas - Conceptos Fundamentales**

## Apertura

¡Hola! Bienvenido a la cuarta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos conceptos fundamentales como el explorador de bloques, Ethereum, contratos inteligentes, consenso y la EVM. Hoy, vamos a profundizar nuestro entendimiento sobre un elemento esencial de la blockchain Ethereum: las **cuentas**. Comprender cómo funcionan las cuentas es crucial para interactuar con la red y desarrollar contratos inteligentes efectivos.

### Programa:

1. Introducción a las Cuentas en la Blockchain Ethereum
2. Cuentas Externas (EOA)
3. Contratos Inteligentes como Cuentas
4. Interacciones entre Cuentas y su Importancia en los Contratos Inteligentes

---

## 1. Introducción a las Cuentas en la Blockchain Ethereum

En la blockchain Ethereum, una **cuenta** representa una entidad que puede enviar y recibir transacciones, así como mantener un saldo de Ether (ETH). Piensa en las cuentas como los "usuarios" de la red. Cada cuenta tiene una **dirección única**, un identificador alfanumérico que la representa en la blockchain.

### Direcciones en Ethereum

- **Formato**: Generalmente, una dirección Ethereum se representa por una secuencia de 42 caracteres hexadecimales, comenzando con `0x`.
- **Ejemplo**: `0x4bbeEB066eD09B7AEd07bF39EeD4B84D0c71F5e6`

### Tipos de Cuentas

Existen dos tipos principales de cuentas en Ethereum:

1. **Cuentas Externas (EOA - External Owned Accounts)**: Controladas por individuos o entidades externas utilizando claves privadas.
2. **Cuentas de Contrato (Contratos Inteligentes)**: Cuentas que contienen código ejecutable almacenado en la blockchain.

Entender la diferencia entre estos tipos de cuentas es fundamental para interactuar con la red Ethereum y desarrollar contratos inteligentes.

## 2. Cuentas Externas (EOA)

### ¿Qué son las Cuentas Externas?

Las **Cuentas Externas** son controladas por usuarios humanos (o entidades) y son las cuentas que utilizamos para enviar y recibir ETH e interactuar con contratos inteligentes.

### Características de las Cuentas Externas

- **Control por Claves**: Cada EOA está asociada a un par de claves criptográficas:
  - **Clave Pública**: Funciona como un número de cuenta bancaria. Es visible públicamente y permite que otros identifiquen la cuenta en la red.
  - **Clave Privada**: Similar a una contraseña o PIN. Debe mantenerse secreta, ya que permite el control total de la cuenta y los fondos asociados.
- **Firmas Digitales**: Las transacciones se autorizan mediante la clave privada a través de firmas digitales, garantizando la autenticidad y seguridad.
- **Envío de Transacciones**: Solo las EOAs pueden iniciar transacciones en Ethereum. Los contratos inteligentes no pueden enviar transacciones por sí solos sin ser activados por una EOA.

### Seguridad de las Claves

- **Protección de la Clave Privada**: Si alguien obtiene acceso a tu clave privada, puede controlar completamente tu cuenta y fondos.
- **Mejores Prácticas**:
  - Nunca compartas tu clave privada.
  - Utiliza carteras seguras y confiables.
  - Haz copias de seguridad en lugares seguros.

## 3. Contratos Inteligentes como Cuentas

### ¿Qué son las Cuentas de Contrato?

Las **Cuentas de Contrato** son cuentas que contienen código de contrato inteligente, almacenado en la blockchain. No se controlan mediante claves privadas, sino por código programado.

### Características de los Contratos Inteligentes

- **Dirección Propia**: Cada contrato inteligente tiene una dirección única en la blockchain, lo que permite que otros interactúen con él.
- **Ejecutado por la EVM**: El código del contrato es ejecutado por la Máquina Virtual Ethereum (EVM) cuando es activado por una transacción.
- **Almacenamiento Interno**: Tienen almacenamiento propio para mantener datos persistentes entre ejecuciones.
- **No Inician Transacciones**: Los contratos no pueden iniciar transacciones por sí mismos; solo responden a transacciones iniciadas por EOAs u otros contratos.

### Interacción con Otras Cuentas

- **Recibir ETH**: Pueden recibir ETH como parte de una transacción.
- **Ejecutar Código**: Cuando una transacción es dirigida a la dirección de un contrato, el código es ejecutado.
- **Llamar a Otros Contratos**: Pueden interactuar con otros contratos inteligentes, permitiendo la creación de aplicaciones complejas.

## 4. Interacciones entre Cuentas e Importancia en los Contratos Inteligentes

### ¿Cómo Interactúan las Cuentas?

- **EOAs Inician Transacciones**: Los usuarios envían transacciones a otras EOAs o contratos inteligentes usando sus claves privadas.
- **Contratos Ejecutan Código**: Cuando un contrato recibe una transacción, su código es ejecutado por la EVM.
- **Llamadas Internas**: Los contratos pueden llamar a funciones de otros contratos, lo que permite la modularidad y reutilización de código.

### Importancia para los Contratos Inteligentes

- **Autonomía Limitada**: Los contratos dependen de las EOAs para ser activados. Esto garantiza que los usuarios tengan control sobre cuándo y cómo se ejecutan los contratos.
- **Seguridad**: La clara distinción entre EOAs y contratos ayuda a mantener la seguridad de la red. Los contratos no pueden robar claves privadas, ya que no tienen acceso a ellas.
- **Desarrollo de DApps**: Entender cómo interactúan las cuentas es esencial para crear aplicaciones descentralizadas (DApps) que funcionen correctamente en Ethereum.

### Escenarios Comunes de Interacción

- **Usuario Envía ETH a Otro Usuario**: Transferencia simple entre dos EOAs.
- **Usuario Interactúa con un Contrato**: Envía una transacción para ejecutar una función del contrato, como participar en una ICO o comprar un NFT.
- **Contrato Llama a Otro Contrato**: Un contrato de subasta llama a un contrato de token para transferir la propiedad de un ítem.

## Conclusión

En esta clase, profundizamos en los conceptos fundamentales de las cuentas en Ethereum, entendiendo la diferencia entre Cuentas Externas y Cuentas de Contrato. Comprendimos cómo interactúan las cuentas en la red, la importancia de las claves públicas y privadas, y cómo todo esto se relaciona con los contratos inteligentes.

Dominar estos conceptos es crucial para cualquier desarrollador que desee crear contratos inteligentes seguros y efectivos. Con este conocimiento, estarás más preparado para escribir código que interactúe correctamente con otras cuentas y entender el comportamiento de las transacciones en la red.

## Recapitulación

1. **Introducción a las Cuentas en la Blockchain Ethereum**: Las cuentas son entidades que pueden enviar y recibir transacciones, identificadas por direcciones únicas.
2. **Cuentas Externas (EOA)**: Controladas por usuarios a través de claves públicas y privadas. Son las únicas que pueden iniciar transacciones.
3. **Contratos Inteligentes como Cuentas**: Cuentas que contienen código ejecutable, sin claves privadas, y que son activadas por transacciones.
4. **Interacciones entre Cuentas**: Comprendimos cómo EOAs y contratos interactúan, y la importancia de esto en el desarrollo de contratos inteligentes.

## Tarea
Escribe un breve resumen explicando la diferencia entre una EOA y una cuenta de contrato inteligente.

## Próxima clase

En la próxima clase, exploraremos la criptografía detrás de las cuentas Ethereum, comprendiendo cómo funcionan las claves públicas y privadas y las firmas digitales. Esto profundizará tu conocimiento sobre la seguridad y autenticidad en la blockchain. ¡Hasta entonces!