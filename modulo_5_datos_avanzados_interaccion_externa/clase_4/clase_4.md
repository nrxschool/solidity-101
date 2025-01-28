# Clase 4: **`fallback` y `receive`: Recibiendo Ether**

## Introducción

¡Hola! Bienvenido a la clase 4 del curso de Solidity. Hoy estudiaremos las funciones especiales `fallback` y `receive`, que permiten que los contratos Solidity reciban Ether directamente con un comportamiento personalizado. Estas funciones son fundamentales para crear contratos flexibles que puedan manejar transacciones de Ether, incluso sin que se llame a una función específica.

### Contenido:

1. Recibiendo Ether en Contratos
2. Función `receive`
3. Función `fallback`
4. Diferencias entre `fallback` y `receive`
5. Cómo elegir entre `fallback` y `receive`

---

## 1. Recibiendo Ether en Contratos

### Visión General

En Solidity, un contrato puede recibir Ether directamente a través de una transferencia. Sin embargo, las funciones `fallback` y `receive` permiten que el contrato ejecute una lógica específica al recibir Ether, como registrar el monto recibido, rechazar la transacción o ejecutar una lógica personalizada.

- **Usos Comunes**:
  - Registrar la recepción de Ether.
  - Ejecutar lógica específica al recibir Ether.
  - Rechazar la recepción bajo ciertas condiciones.

---

## 2. Función `receive`

### ¿Qué es la función `receive`?

- **Definición**: `receive` se llama automáticamente cuando el contrato recibe Ether **sin datos (calldata)**.
- **Características**:
  - Debe declararse como `external payable`.
  - No puede tener argumentos ni devolver valores.
- **Ejemplo de Uso**:

    ```solidity
    receive() external payable {
        emit EtherRecibido(msg.sender, msg.value);
    }
    ```

- **Descripción**: Aquí, la función `receive` emite un evento `EtherRecibido` cada vez que el contrato recibe Ether sin datos. Esta función es útil para contratos que solo necesitan registrar la recepción de Ether.

---

## 3. Función `fallback`

### ¿Qué es la función `fallback`?

- **Definición**: La función `fallback` se llama en dos situaciones:
  - Cuando el contrato recibe Ether **con datos** (calldata) que no coinciden con ninguna función.
  - Cuando la llamada al contrato no corresponde a ninguna función existente.
- **Características**:
  - Puede declararse como `external payable` o `external`.
  - Puede tener argumentos y devolver valores, pero está limitada en términos de consumo de gas.

- **Ejemplo de Uso**:

    ```solidity
    fallback() external payable {
        // Lógica para manejar los datos recibidos
    }
    ```

- **Descripción**: En este ejemplo, la función `fallback` se activa siempre que el contrato reciba datos desconocidos o sin una función correspondiente. Esta función es útil cuando queremos que el contrato maneje lógica específica al recibir llamadas inesperadas.

---

## 4. Diferencias entre `fallback` y `receive`

| Característica        | `receive`                     | `fallback`                            |
|-----------------------|-------------------------------|---------------------------------------|
| **Calldata**          | Sin calldata                  | Con calldata o función desconocida    |
| **Argumentos**        | No puede tener                | Puede tener                           |
| **Retorno**           | No puede devolver valores     | Puede devolver valores                |
| **Gas Limitado**      | No                            | Sí                                    |

---

## 5. Cómo elegir entre `fallback` y `receive`

- **`receive`**: Úselo cuando el contrato solo necesite recibir Ether, sin datos.
- **`fallback`**: Úselo para manejar datos y llamadas inesperadas, o cuando necesite lógica más compleja.

---

## Ejemplo Completo

Aquí hay un ejemplo completo de un contrato que utiliza las funciones `fallback` y `receive` para recibir Ether.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ReceptorDeEther {
    event EtherRecibido(address remitente, uint valor);

    // Función para recibir Ether sin datos
    receive() external payable {
        emit EtherRecibido(msg.sender, msg.value);
    }

    // Función para recibir llamadas desconocidas y con datos
    fallback() external payable {
        // Lógica para manejar el calldata
    }
}
```

- **Descripción**:
  - La función `receive` emite un evento cuando el contrato recibe Ether sin calldata.
  - La función `fallback` permite que el contrato maneje llamadas con datos no identificados.

---

## Conclusión

En esta clase, exploramos las funciones `fallback` y `receive` en Solidity, que permiten que los contratos inteligentes reciban Ether de forma personalizada. Vimos que la función `receive` se llama para transferencias sin datos, mientras que `fallback` se activa cuando la llamada no corresponde a ninguna función. Este conocimiento es importante para desarrollar contratos que puedan manejar transferencias de Ether, ampliando sus funcionalidades y versatilidad.

---

## Resumen

1. **Recibiendo Ether**:
   - Los contratos pueden recibir Ether directamente y personalizar su comportamiento con `fallback` y `receive`.
2. **Función `receive`**:
   - Se llama cuando el contrato recibe Ether sin datos (calldata).
3. **Función `fallback`**:
   - Se llama cuando hay datos que no coinciden con ninguna función o llamada desconocida.
4. **Elección de Funciones**:
   - `receive` para recibir solo Ether.
   - `fallback` para manejar llamadas desconocidas o con datos.

---

## Tarea

Crea un contrato llamado `RegistroDeDonaciones` que registre todas las donaciones enviadas al contrato. Implementa las funciones `receive` y `fallback` para que las donaciones se registren con un evento, independientemente de si hay datos o no en la llamada.

---

## Próxima Clase

En la próxima clase, aprenderemos sobre **Contratos Multisig y Gobernanza en Solidity**. ¡Nos vemos pronto!