# Clase 3: **Tipos de Datos en Solidity (Parte 2)**

## Introducción

En la clase anterior, exploramos los tipos de datos básicos en Solidity, como booleanos, enteros, direcciones, bytes y cadenas. Hoy continuaremos nuestro viaje profundizando en el conocimiento sobre operadores y estructuras condicionales en Solidity. Comprender estos conceptos es esencial para manipular datos y controlar el flujo de ejecución en tus contratos inteligentes. ¡Comencemos!

### Agenda:

1. Operadores en Solidity  
2. Estructuras Condicionales  

---

## 1. Operadores en Solidity

Los **operadores** son símbolos que indican al compilador realizar operaciones matemáticas, lógicas o relacionales específicas. Son fundamentales para manipular datos y tomar decisiones dentro de los contratos inteligentes.

### Operadores Aritméticos

Utilizados para realizar operaciones matemáticas básicas.

- **Suma (`+`)**: Suma dos operandos.

  ```solidity
  uint a = 10 + 5; // Resultado: 15
  ```

- **Resta (`-`)**: Resta el segundo operando del primero.

  ```solidity
  uint b = 10 - 5; // Resultado: 5
  ```

- **Multiplicación (`*`)**: Multiplica dos operandos.

  ```solidity
  uint c = 10 * 5; // Resultado: 50
  ```

- **División (`/`)**: Divide el primer operando entre el segundo.

  ```solidity
  uint d = 10 / 5; // Resultado: 2
  ```

- **Módulo (`%`)**: Devuelve el residuo de la división del primer operando entre el segundo.

  ```solidity
  uint e = 10 % 3; // Resultado: 1
  ```

- **Exponenciación (`**`)**: Eleva el primer operando a la potencia del segundo.

  ```solidity
  uint f = 2 ** 3; // Resultado: 8
  ```

### Operadores de Comparación

Utilizados para comparar valores y devolver un valor booleano (`true` o `false`).

- **Igual a (`==`)**: Verifica si dos operandos son iguales.

  ```solidity
  bool resultado = (5 == 5); // true
  ```

- **Diferente de (`!=`)**: Verifica si dos operandos son diferentes.

  ```solidity
  bool resultado = (5 != 3); // true
  ```

- **Mayor que (`>`)**: Verifica si el primer operando es mayor que el segundo.

  ```solidity
  bool resultado = (5 > 3); // true
  ```

- **Menor que (`<`)**: Verifica si el primer operando es menor que el segundo.

  ```solidity
  bool resultado = (5 < 3); // false
  ```

- **Mayor o igual a (`>=`)**: Verifica si el primer operando es mayor o igual al segundo.

  ```solidity
  bool resultado = (5 >= 5); // true
  ```

- **Menor o igual a (`<=`)**: Verifica si el primer operando es menor o igual al segundo.

  ```solidity
  bool resultado = (5 <= 3); // false
  ```

### Operadores Lógicos

Utilizados para combinar condiciones lógicas.

- **AND Lógico (`&&`)**: Devuelve `true` si ambos operandos son verdaderos.

  ```solidity
  bool resultado = (true && false); // false
  ```

- **OR Lógico (`||`)**: Devuelve `true` si al menos uno de los operandos es verdadero.

  ```solidity
  bool resultado = (true || false); // true
  ```

- **Negación Lógica (`!`)**: Invierte el valor lógico del operando.

  ```solidity
  bool resultado = !true; // false
  ```

**Ejemplo Práctico:**

```solidity
pragma solidity ^0.8.0;

contract OperadoresEjemplo {
    function operacionesAritmeticas(uint a, uint b) public pure returns (uint suma, uint resta, uint multiplicacion, uint division, uint modulo, uint exponenciacion) {
        suma = a + b;
        resta = a - b;
        multiplicacion = a * b;
        division = a / b;
        modulo = a % b;
        exponenciacion = a ** b;
    }

    function comparaciones(uint a, uint b) public pure returns (bool igual, bool diferente, bool mayor, bool menor, bool mayorOIgual, bool menorOIgual) {
        igual = a == b;
        diferente = a != b;
        mayor = a > b;
        menor = a < b;
        mayorOIgual = a >= b;
        menorOIgual = a <= b;
    }

    function logicos(bool x, bool y) public pure returns (bool andLogico, bool orLogico, bool negacionX) {
        andLogico = x && y;
        orLogico = x || y;
        negacionX = !x;
    }
}
```

---

## 2. Estructuras Condicionales

Las estructuras condicionales permiten que el contrato tome decisiones basadas en ciertas condiciones, controlando el flujo de ejecución del código.

### `if`, `else if`, `else`

- **`if`**: Ejecuta un bloque de código si la condición es verdadera.

  ```solidity
  if (condicion) {
      // Código a ejecutar si la condición es verdadera
  }
  ```

- **`else if`**: Opcional, verifica otra condición si la anterior es falsa.

  ```solidity
  if (condicion1) {
      // Código si condicion1 es verdadera
  } else if (condicion2) {
      // Código si condicion1 es falsa y condicion2 es verdadera
  }
  ```

- **`else`**: Opcional, ejecuta un bloque de código si todas las condiciones anteriores son falsas.

  ```solidity
  if (condicion1) {
      // Código si condicion1 es verdadera
  } else if (condicion2) {
      // Código si condicion1 es falsa y condicion2 es verdadera
  } else {
      // Código si todas las condiciones son falsas
  }
  ```

## Conclusión

En esta clase, profundizamos nuestro conocimiento sobre operadores y estructuras condicionales en Solidity. Aprendimos a usar operadores aritméticos, de comparación y lógicos para manipular datos y controlar el flujo de ejecución de nuestros contratos inteligentes. Las estructuras condicionales como `if`, `else if` y `else` son fundamentales para tomar decisiones en el código, permitiendo que los contratos reaccionen a diferentes situaciones.

---

## Resumen

1. **Operadores en Solidity**: Aprendimos sobre operadores aritméticos (`+`, `-`, `*`, `/`, `%`, `**`), de comparación (`==`, `!=`, `>`, `<`, `>=`, `<=`) y lógicos (`&&`, `||`, `!`), y cómo utilizarlos en nuestros contratos.  
2. **Estructuras Condicionales**: Vimos cómo controlar el flujo de ejecución del contrato usando `if`, `else if` y `else`, permitiendo que el contrato tome decisiones basadas en condiciones específicas.  

---

## Tarea

Desarrolla un contrato llamado `Comparador` que tenga una función que reciba dos números enteros y devuelva una cadena indicando cuál número es mayor o si son iguales.

## Próxima Clase

En la próxima clase, continuaremos explorando los tipos de datos en Solidity, enfocándonos en arrays, mappings y estructuras más complejas. Aprenderemos cómo estas estructuras nos permiten crear contratos inteligentes más poderosos y flexibles. ¡Prepárate para profundizar aún más tus conocimientos en Solidity! ¡Hasta entonces!
