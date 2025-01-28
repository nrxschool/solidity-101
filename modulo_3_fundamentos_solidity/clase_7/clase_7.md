# Clase 7: **Modificadores de Variables**

## Introducción

¡Hola! Bienvenido a la séptima clase de nuestro curso de Solidity para principiantes. En las clases anteriores, aprendimos sobre los tipos de datos en Solidity y la estructura básica de un contrato. Hoy, exploraremos los **modificadores de variables** `constant` e `immutable`, que nos permiten declarar variables fijas en Solidity. Comprender el uso de estos modificadores es esencial para optimizar tus contratos y ahorrar gas durante la ejecución. ¡Comencemos!

### Agenda:

1. Modificadores de Variables  
2. `constant`  
3. `immutable`  
4. Diferencias entre `constant` e `immutable`  
5. Ventajas  

---

## 1. Modificadores de Variables

- **Definición**: `constant` e `immutable` son modificadores utilizados para definir variables de valor fijo en Solidity.  
- **Inmutabilidad**: Una vez inicializadas, estas variables no pueden ser modificadas.  
- **Uso Común**: Valores inmutables como tasas, direcciones de contratos externos o configuraciones del contrato.  
- **Ventaja**: Ahorran gas y espacio de almacenamiento al evitar el uso de storage para valores que no cambian.  

---

## 2. `constant`

- **Inicialización**: Una variable `constant` se inicializa con un valor fijo en el momento de su **declaración**.  
- **Tiempo de Compilación**: Su valor debe ser conocido en **tiempo de compilación**, es decir, debe ser un valor literal o una expresión computable por el compilador.  
- **Ejemplo de Uso**:

  ```solidity
  uint256 public constant TASA = 10; // Valor fijo de la tasa
  ```

- **Notas**:
  - Ideal para valores que nunca cambian y son conocidos antes del despliegue del contrato.  
  - El compilador reemplaza referencias a la variable `constant` por su valor literal, optimizando el código.  

---

## 3. `immutable`

- **Inicialización**: Una variable `immutable` puede inicializarse solo una vez, durante la ejecución del **constructor** del contrato.  
- **Tiempo de Ejecución**: Permite que el valor sea determinado en **tiempo de ejecución**, posibilitando el uso de valores dinámicos.  
- **Ejemplo de Uso**:

  ```solidity
  address public immutable owner; // Dirección del propietario del contrato

  constructor() {
      owner = msg.sender; // Inicializa con la dirección del creador del contrato
  }
  ```

- **Notas**:
  - Útil cuando el valor depende de información disponible únicamente en el momento del despliegue.  
  - Una vez inicializado en el constructor, el valor no puede ser modificado.  

---

## 4. Diferencias entre `constant` e `immutable`

| Característica                       | `constant`               | `immutable`              |
|--------------------------------------|--------------------------|--------------------------|
| **Inicialización**                   | En la declaración        | En el constructor        |
| **Tiempo de Determinación del Valor**| Tiempo de compilación    | Tiempo de ejecución      |

- **Resumen**:
  - **`constant`**: Para valores conocidos de antemano que no dependen de variables de tiempo de ejecución.  
  - **`immutable`**: Para valores fijos después del despliegue, pero que dependen de datos disponibles solo en tiempo de ejecución.  

---

## 5. Ventajas

1. **Ahorro de Gas**: Como no ocupan storage, reducen el consumo de gas necesario para acceder y modificar variables.  
2. **Optimización del Código**: El compilador optimiza reemplazando las variables `constant` por sus valores directamente en el código.  
3. **Seguridad**: Protegen valores fijos de modificaciones accidentales o maliciosas, aumentando la seguridad del contrato.  

Estos modificadores de variables son ideales para configurar constantes y valores fundamentales del contrato que deben permanecer inalterados durante su ejecución.  

---

## Conclusión

En esta clase, aprendimos sobre los modificadores de variables `constant` e `immutable` en Solidity. Comprendimos cómo y cuándo usarlos para declarar variables fijas, optimizando nuestros contratos y ahorrando gas. Saber diferenciar entre `constant` e `immutable` nos permite escribir contratos más eficientes, seguros y fáciles de mantener.  

---

## Resumen

1. **Modificadores de Variables**: `constant` e `immutable` se utilizan para declarar variables fijas que no pueden modificarse después de la inicialización.  
2. **`constant`**:
   - Inicializado en la declaración.  
   - Valor conocido en tiempo de compilación.  
   - Reemplazado directamente en el código por el compilador.  
3. **`immutable`**:
   - Inicializado en el constructor.  
   - Valor determinado en tiempo de ejecución.  
   - Almacenado en el código del contrato.  
4. **Diferencias**:
   - `constant` para valores conocidos de antemano.  
   - `immutable` para valores fijos después del despliegue, pero dependientes de información en tiempo de ejecución.  
5. **Ventajas**:
   - Ahorro de gas.  
   - Optimización del código.  
   - Seguridad.  

---

## Tarea

- **Tarea Fácil**:
  - Declara una variable `constant` llamada `NOMBRE_DEL_CONTRATO` que almacene el nombre de tu contrato.  

- **Tarea Media**:
  - Crea un contrato que utilice una variable `immutable` para almacenar la dirección del propietario (`owner`) y restringe el acceso a una función usando esta dirección.  

- **Tarea Difícil**:
  - Implementa un contrato donde utilices tanto variables `constant` como `immutable` para configurar tasas fijas y direcciones de contratos externos, y crea funciones que interactúen con estas configuraciones, demostrando el ahorro de gas.  

---

## Próximo Módulo

En el próximo módulo exploraremos funciones y aprenderemos en detalle sobre los lugares de almacenamiento. 