# Clase 8: **¿Qué es Blockchain?**

## Apertura

¡Hola! Bienvenido a la octava clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos diversos aspectos de la blockchain y los contratos inteligentes. Hoy, haremos una breve consolidación para definir claramente qué es **blockchain**. Esta clase será corta, pero fundamental para reforzar nuestra comprensión antes de avanzar a temas más complejos.

### Programa:

1. Definición de Blockchain

---

## 1. Definición de Blockchain

Blockchain es un tipo específico de tecnología de registro distribuido (DLT, por sus siglas en inglés: Distributed Ledger Technology). Se trata de un sistema que permite que computadoras en diferentes ubicaciones propongan, validen transacciones y actualicen registros de manera sincronizada a través de una red. A diferencia de las bases de datos distribuidas tradicionales, que generalmente dependen de una autoridad central para mantener la consistencia de los registros, blockchain funciona sin la necesidad de un administrador central confiable.

En sistemas como Bitcoin y Ethereum, blockchain mantiene un registro distribuido de manera descentralizada utilizando procedimientos de validación basados en consenso y firmas criptográficas. Las transacciones se realizan de manera peer-to-peer (de punto a punto) y son transmitidas a todos los participantes, quienes trabajan para validarlas en lotes conocidos como "bloques". Como el registro de actividades se organiza en bloques separados pero conectados, este tipo de DLT a menudo se denomina "tecnología blockchain".

### Componentes Principales:

- **Bloques**: Unidades que contienen un conjunto de transacciones o información. Cada bloque tiene un identificador único llamado hash.
- **Cadena de Bloques**: Cada bloque está vinculado al anterior a través de su hash, formando una cadena continua e inalterable.
- **Nodos**: Computadoras que participan en la red, manteniendo una copia completa de la blockchain y validando nuevas transacciones.
- **Mecanismos de Consenso**: Protocolos que permiten que los nodos acuerden sobre el estado actual de la blockchain (por ejemplo, Proof-of-Work, Proof-of-Stake).

### Características Fundamentales:

- **Descentralización**: Los datos no están controlados por una única entidad; en su lugar, están distribuidos entre todos los nodos de la red.
- **Inmutabilidad**: Una vez que los datos son registrados en un bloque y añadidos a la blockchain, no pueden ser modificados ni eliminados.
- **Transparencia**: Todas las transacciones son visibles para los participantes de la red, lo que aumenta la confianza y la responsabilidad.
- **Seguridad**: La criptografía avanzada protege las transacciones e impide modificaciones no autorizadas.

### ¿Cómo Funciona Blockchain?

1. **Transacción**: Se crea una nueva transacción y se transmite a la red.
2. **Validación**: Los nodos verifican si la transacción es válida según las reglas del protocolo.
3. **Agrupación en Bloques**: Las transacciones válidas se agrupan en un bloque.
4. **Prueba de Consenso**: El bloque es validado mediante un mecanismo de consenso.
5. **Añadido a la Cadena**: Una vez validado, el bloque se añade a la blockchain, y la copia actualizada se distribuye a todos los nodos.
6. **Registro Permanente**: La transacción ahora forma parte del registro permanente y puede ser visualizada por cualquier participante.

### Importancia de Blockchain:

- **Eliminación de Intermediarios**: Permite transacciones directas entre partes, reduciendo costos y aumentando la eficiencia.
- **Confianza en Sistemas Sin Confianza**: Proporciona un entorno seguro donde participantes desconocidos pueden interactuar sin necesidad de confiar entre sí.
- **Innovación Tecnológica**: Base para el desarrollo de criptomonedas, contratos inteligentes y aplicaciones descentralizadas (dApps).

## Conclusión

En esta clase, consolidamos el concepto de blockchain, comprendiendo su definición y los componentes fundamentales. Entendimos cómo blockchain funciona como una tecnología revolucionaria que está transformando diversos sectores, más allá de las finanzas, gracias a su capacidad para proporcionar seguridad, transparencia y descentralización.

## Recapitulación

1. **Definición de Blockchain**: Una tecnología de registro distribuido, inmutable y transparente que permite transacciones seguras sin intermediarios.

## Próximo módulo

En el próximo módulo, presentaremos las herramientas necesarias para que puedas desarrollar con Solidity.