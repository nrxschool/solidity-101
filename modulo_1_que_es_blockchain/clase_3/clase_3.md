# Clase 3: **Consenso, Estado y la Máquina Virtual de Ethereum (EVM)**

## Apertura

¡Hola! Bienvenido a la tercera clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos el block explorer y comprendimos los fundamentos de Ethereum y los contratos inteligentes. Hoy, profundizaremos en los pilares fundamentales que sustentan la red Ethereum: el consenso, el estado y la Máquina Virtual de Ethereum (EVM). Estos conceptos son esenciales para entender cómo funciona la blockchain y cómo se ejecutan los contratos inteligentes.

### Programa:

1. Mecanismos de Consenso en la Blockchain
2. El Concepto de Estado en Ethereum
3. La Máquina Virtual de Ethereum (EVM)
4. Componentes y Funcionamiento de la EVM

---

## 1. Mecanismos de Consenso en la Blockchain

### ¿Qué es el Consenso?

El **consenso** en la blockchain es el acuerdo general entre los nodos de la red sobre el estado actual y la validez de las transacciones. Es el proceso que asegura que todas las partes de la red estén sincronizadas y de acuerdo con la secuencia de bloques añadidos a la blockchain.

> **Definición:** Mecanismo por el cual los participantes de la red acuerdan una única versión de la verdad, asegurando la integridad y seguridad de la blockchain.

### Importancia del Consenso

- **Integridad de la Red**: Asegura que todos los nodos tengan la misma información, evitando discrepancias.
- **Seguridad**: Protege la red contra ataques y intentos de fraude.
- **Inmutabilidad**: Una vez que un bloque se añade, no puede ser alterado sin el consenso de la mayoría.

### ¿Cómo Funciona el Consenso?

Existen dos pasos principales en el proceso de consenso:

1. **Decidir Quién Producirá y Propondrá el Bloque**:
   - Se utilizan mecanismos como Proof-of-Work (PoW) o Proof-of-Stake (PoS) para seleccionar al productor del siguiente bloque.
   - **Objetivo**: Garantizar que la selección sea justa e impedir que un solo participante controle la red.

2. **Aceptación del Bloque por los Otros Nodos**:
   - Después de la creación, el bloque se propaga a los otros nodos para su validación.
   - Si la mayoría acepta el bloque, se añade a la blockchain.

> **Nota:** El consenso previene ataques Sybil, en los que un solo agente intenta asumir múltiples identidades para controlar la red.

### Mecanismos de Consenso en Ethereum

#### Proof-of-Work (PoW): El Antiguo Mecanismo

- **Creación de Bloques**: Los mineros competían para resolver problemas matemáticos complejos (hashing) para crear nuevos bloques.
- **Recompensa**: El primero en resolver el problema añadía el bloque y recibía una recompensa en ETH.
- **Seguridad**: La seguridad estaba garantizada por la necesidad de controlar el 51% del poder computacional de la red, lo cual era extremadamente costoso.

#### Proof-of-Stake (PoS): El Actual Mecanismo

- **Creación de Bloques**: Los validadores son seleccionados aleatoriamente para proponer nuevos bloques, basándose en la cantidad de ETH en stake (garantía).
- **Recompensa**: Los validadores honestos reciben recompensas por validar y proponer bloques correctamente.
- **Seguridad**: Los ataques son desalentados, ya que los validadores pueden perder su stake en caso de comportamiento malicioso.

> **Beneficios del PoS**:
>
> - **Eficiencia Energética**: Consume menos energía que el PoW.
> - **Descentralización**: Facilita la participación de más validadores.
> - **Seguridad Económica**: Los ataques se vuelven financieramente inviables.

## 2. El Concepto de Estado en Ethereum

### ¿Qué es Estado?

El **estado** en Ethereum representa la condición actual de la red en un momento determinado, incluyendo saldos de cuentas, almacenamiento de contratos inteligentes y otros datos persistentes.

> **Definición:** Fotografía del sistema que refleja toda la información y los datos almacenados en la blockchain en ese momento.

### Almacenamiento del Estado

- **Saldos de Cuentas**: Cantidad de ETH que cada dirección posee.
- **Contratos Inteligentes**: Código y almacenamiento interno de los contratos.
- **Datos Persistentes**: Información que debe ser mantenida entre transacciones.

### Cambios de Estado

- El estado se altera a través de **transacciones** que ejecutan operaciones, como transferencias de ETH o llamadas a contratos inteligentes.
- Cada transacción válida resulta en una actualización del estado global de la red.

### Papel de la EVM en el Estado

La **Máquina Virtual Ethereum (EVM)** procesa las transacciones y aplica los cambios necesarios al estado, garantizando que cada nodo en la red tenga una copia actualizada y consistente.

## 3. La Máquina Virtual de Ethereum (EVM)

### ¿Qué es la EVM?

La **Máquina Virtual de Ethereum (EVM)** es el entorno de ejecución de los contratos inteligentes en Ethereum. Es responsable de interpretar y ejecutar el bytecode de los contratos inteligentes.

> **Definición:** Una máquina virtual Turing Completa que permite la ejecución de código arbitrario, siempre y cuando haya gas suficiente para pagar por la computación.

### Características de la EVM

- **Turing Completa**: Capaz de ejecutar cualquier cálculo computacional, dado los recursos suficientes.
- **Aislamiento**: Ejecuta contratos en un entorno aislado, garantizando la seguridad de la red.
- **Determinística**: Garantiza que, dada una entrada específica, el resultado siempre será el mismo en todos los nodos.

### Gas en la EVM

- El **gas** es la unidad de medida del esfuerzo computacional en la EVM.
- Cada operación tiene un costo en gas, que debe ser pagado por el remitente de la transacción.
- El gas impide bucles infinitos y el uso excesivo de recursos, garantizando que los contratos se ejecuten de manera eficiente.

## 4. Componentes y Funcionamiento de la EVM

### Funcionamiento de la EVM

1. **Lectura y Verificación de la Transacción**: La EVM recibe la transacción y verifica su validez y firma.
2. **Inicialización con el Código del Contrato**: Carga el bytecode del contrato inteligente que se va a ejecutar.
3. **Ejecución Paso a Paso del Código**: Interpreta cada instrucción (opcode) y ejecuta las operaciones correspondientes.
4. **Cálculo y Deducción del Gas**: Calcula el gas consumido por cada operación y lo deduce del total proporcionado.
5. **Actualización del Estado**: Aplica los cambios resultantes de la ejecución al estado global.
6. **Devolución de Resultados**: Proporciona la salida o el resultado de la ejecución, si es aplicable.

### Componentes Principales de la EVM

- **Storage**: Almacenamiento permanente utilizado por los contratos para guardar datos entre transacciones. Es específico por contrato y persiste en la blockchain.
- **Memory**: Memoria temporal utilizada durante la ejecución de una transacción. Se limpia después de completar la ejecución.
- **Stack**: Pila de datos usada para operaciones temporarias y para pasar argumentos entre instrucciones.
- **Code**: El bytecode del contrato inteligente que se está ejecutando.
- **Args (Argumentos)**: Datos de entrada proporcionados a la función o contrato que se está llamando.

### Opcodes

- **Definición**: Instrucciones básicas que la EVM puede ejecutar, como operaciones aritméticas, lógicas, acceso al almacenamiento, etc.
- **Ejemplos**:
  - `ADD`: Suma dos valores.
  - `SSTORE`: Almacena un valor en el storage.
  - `CALL`: Llama a otra función o contrato.

> **Nota:** El conocimiento de los opcodes es avanzado, pero entender que cada línea de código Solidity se compila en una secuencia de opcodes ayuda a optimizar y escribir contratos más eficientes.

## Conclusión

En esta clase, exploramos los conceptos fundamentales que permiten el funcionamiento de Ethereum:

- Comprendimos cómo el **consenso** mantiene la red segura y confiable.
- Aprendimos sobre el **estado**, que representa la información actual de la blockchain.
- Conocimos la **EVM**, el entorno donde se ejecutan los contratos inteligentes.
- Detallamos los **componentes y el funcionamiento de la EVM**, esenciales para la ejecución correcta y eficiente de los contratos.

Estos conceptos son cruciales para cualquier desarrollador que desee crear contratos inteligentes seguros y eficientes en la red Ethereum.

## Recapitulación

1. **Mecanismos de Consenso en la Blockchain**: El acuerdo entre los nodos sobre el estado de la red, garantizando integridad y seguridad.
2. **El Concepto de Estado en Ethereum**: Representa la condición actual de la blockchain, incluidos saldos y datos de contratos.
3. **La Máquina Virtual Ethereum (EVM)**: Entorno de ejecución de los contratos inteligentes, capaz de ejecutar código arbitrario.
4. **Componentes y Funcionamiento de la EVM**: Elementos clave como el almacenamiento, memoria, pila y opcodes.