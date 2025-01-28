# Clase 6: **Variables Globales en Solidity**

## Introducción

¡Hola! Bienvenido a la sexta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos los tipos de datos y la anatomía básica de un contrato en Solidity. Hoy profundizaremos en las **variables globales** en Solidity, que son esenciales para interactuar con el entorno de ejecución y obtener información contextual importante para tus contratos inteligentes. Vamos a entender qué son estas variables, cómo usarlas y cuál es su papel en el desarrollo de contratos eficientes y seguros.

### Agenda:

1. Variables Globales  
2. Categorías de Variables Globales  
3. Ejemplos de Variables Globales  
4. Uso en Contratos Inteligentes  

---

## 1. Variables Globales

- **Definición**: Variables predefinidas proporcionadas por Solidity que ofrecen información sobre el entorno de ejecución en Ethereum.  
- **Acceso**: Se pueden acceder desde cualquier función o parte del contrato inteligente.  
- **Uso**: Proporcionan datos sobre transacciones, bloques y propiedades del contrato actual, permitiendo que tus contratos interactúen de forma dinámica con la blockchain.  

---

## 2. Categorías de Variables Globales

1. **Variables de Bloque**: Información sobre el bloque actual en la blockchain.  
2. **Variables de Transacción**: Datos específicos de la transacción en ejecución.  
3. **Variables del Contrato**: Información contextual del propio contrato inteligente.  

---

## 3. Ejemplos de Variables Globales

| Variable            | Descripción                                                                                      |
|---------------------|--------------------------------------------------------------------------------------------------|
| `block.number`      | Número del bloque actual.                                                                        |
| `block.timestamp`   | Fecha y hora del bloque actual (en segundos desde la época Unix).                                |
| `msg.sender`        | Dirección del remitente de la transacción actual.                                                |
| `msg.value`         | Cantidad de Ether enviada con la transacción actual (en wei).                                    |
| `tx.origin`         | Dirección de la cuenta inicial que originó la transacción (incluso en llamadas anidadas).        |
| `gasleft()`         | Cantidad de gas restante para la ejecución de la función actual.                                 |
| `this`              | Dirección del contrato actual.                                                                  |

---

## 4. Uso en Contratos Inteligentes

El siguiente ejemplo ilustra cómo usar algunas variables globales en un contrato en Solidity:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract MiContrato {
    // Almacena el timestamp de la última vez que se llamó a una función
    uint256 public ultimaLlamada;

    // Función que registra el timestamp actual en la variable 'ultimaLlamada'
    function actualizarTimestamp() public {
        ultimaLlamada = block.timestamp; // Captura el tiempo del bloque actual
    }

    // Función que retorna el saldo actual del contrato
    function obtenerSaldo() public view returns (uint256) {
        return address(this).balance; // Retorna el saldo del propio contrato
    }
}
```

### Explicación del Código

1. **`block.timestamp`**: Usado para registrar el momento de la última llamada de la función `actualizarTimestamp`.  
2. **`address(this).balance`**: Retorna el saldo de Ether disponible en el contrato, utilizando la dirección del propio contrato (`this`).  

---

Estas variables globales ayudan a acceder a información contextual fundamental para la lógica de los contratos inteligentes, como verificar el tiempo de ejecución, identificar remitentes y gestionar el saldo del contrato.

---

## Conclusión

En esta clase, exploramos las **variables globales** en Solidity, entendiendo cómo proporcionan información esencial sobre el entorno de ejecución. Vimos cómo estas variables pueden ser utilizadas para crear contratos inteligentes más dinámicos e interactivos, permitiendo que accedas a datos como la dirección del remitente, el timestamp actual, el número de bloque y mucho más. Comprender y utilizar estas variables es crucial para el desarrollo de contratos eficientes y seguros.

---

## Resumen

1. **Variables Globales**: Son variables predefinidas que proporcionan información sobre el entorno de ejecución de Ethereum.  
2. **Categorías de Variables**:
   - **Variables de Bloque**: Información sobre el bloque actual (e.g., `block.number`, `block.timestamp`).  
   - **Variables de Transacción**: Datos de la transacción en ejecución (e.g., `msg.sender`, `msg.value`).  
   - **Variables del Contrato**: Información sobre el propio contrato (e.g., `this`).  
3. **Uso en Contratos**: Aprendimos a usar estas variables para registrar timestamps, obtener el saldo del contrato e interactuar con el entorno de ejecución.  

---

## Tarea

Crea un contrato que registre la dirección de quien llamó a una función usando `msg.sender`. Implementa un contrato que restrinja el acceso a una función para que solo pueda ser llamada después de un determinado tiempo, utilizando `block.timestamp`.  

---

## Próxima clase

En la próxima clase, exploraremos los modificadores de variables.  
