# Clase 3: **`virtual` y `override`: Herencia y Polimorfismo**

## Introducción

¡Hola! Bienvenido a la Clase 3 del curso de Solidity. En la clase de hoy, exploraremos dos conceptos fundamentales en la programación orientada a objetos: **Herencia** y **Polimorfismo**. En Solidity, estos conceptos se implementan a través de las funciones `virtual` y `override`, que permiten crear contratos extensibles y reutilizables. Comprender cómo funcionan estos mecanismos es esencial para desarrollar contratos inteligentes organizados, eficientes y modulares.

### Contenido:

1. Herencia
2. Polimorfismo
3. Funciones `virtual`
4. Funciones `override`
5. Ejemplo Práctico

---

## 1. Herencia

### ¿Qué es la Herencia?

- **Definición**: La herencia permite que nuevos contratos (hijos) hereden las propiedades y comportamientos de contratos existentes (padres).
- **Reutilización de Código**: Con la herencia, evitamos la duplicación de lógica en contratos relacionados, promoviendo la organización en jerarquías.
- **Sintaxis**: Usamos la palabra clave `is` para indicar que un contrato hereda de otro.

#### Ejemplo

```solidity
contract Hijo is Padre {
    // El contrato Hijo hereda todas las propiedades y funciones del contrato Padre.
}
```

---

## 2. Polimorfismo

### ¿Qué es el Polimorfismo?

- **Definición**: Permite que funciones con el mismo nombre tengan diferentes implementaciones en contratos diferentes.
- **Uso en Solidity**: Las funciones `virtual` y `override` se utilizan para definir y sobrescribir comportamientos en contratos que emplean herencia.

---

## 3. Funciones `virtual`

### Definiendo Funciones `virtual`

- **Descripción**: En los contratos padres, declaramos funciones como `virtual` para permitir que los contratos hijos modifiquen el comportamiento de estas funciones.
- **Cuándo Usar**: Utilice `virtual` para indicar que la función puede ser sobrescrita.
- **Sintaxis**: `function nombreFuncion() public virtual { ... }`

#### Ejemplo

```solidity
contract Animal {
    function sonido() public virtual pure returns (string memory) {
        return "Sonido genérico de animal";
    }
}
```

---

## 4. Funciones `override`

### Sobrescribiendo Funciones con `override`

- **Descripción**: Los contratos hijos utilizan `override` para modificar la implementación de funciones `virtual` definidas en el contrato padre.
- **Cuándo Usar**: Use `override` al definir una nueva implementación para una función heredada.
- **Sintaxis**: `function nombreFuncion() public override { ... }`

#### Ejemplo

```solidity
contract Perro is Animal {
    function sonido() public override pure returns (string memory) {
        return "¡Guau guau!";
    }
}
```

---

## 5. Ejemplo Práctico

En este ejemplo, crearemos una jerarquía de contratos utilizando herencia, donde `Animal` es el contrato padre, y `Perro` es un contrato hijo que sobrescribe la función `sonido` del contrato padre.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Animal {
    function sonido() public virtual pure returns (string memory) {
        return "Sonido genérico de animal";
    }
}

contract Perro is Animal {
    function sonido() public override pure returns (string memory) {
        return "¡Guau guau!";
    }
}
```

- **Descripción**:
  - El contrato `Animal` define la función `sonido` como `virtual`, permitiendo que sea sobrescrita.
  - El contrato `Perro` hereda de `Animal` y utiliza `override` para proporcionar una implementación específica de la función `sonido`.

---

## Ventajas de la Herencia y el Polimorfismo

1. **Reutilización de Código**: Los contratos hijos heredan funcionalidades del contrato padre, evitando la duplicación de código.
2. **Extensibilidad**: Los contratos hijos pueden expandir y modificar comportamientos heredados, facilitando la creación de sistemas complejos.
3. **Mantenibilidad**: Los contratos organizados jerárquicamente son más fáciles de entender y mantener.
4. **Flexibilidad**: Las funciones `virtual` y `override` permiten una mayor adaptabilidad del código, ajustando comportamientos según sea necesario.

---

## Conclusión

En esta clase, aprendimos a usar las palabras clave `virtual` y `override` para implementar **Herencia** y **Polimorfismo** en Solidity. Estas herramientas son fundamentales para crear contratos organizados, reutilizables y flexibles. Comprender y aplicar herencia y polimorfismo permite desarrollar sistemas complejos y modulares de forma más eficiente, aprovechando al máximo el potencial de la programación orientada a objetos en contratos inteligentes.

---

## Resumen

1. **Herencia**:
   - Permite que los contratos hijos hereden propiedades y comportamientos de los contratos padres.
2. **Polimorfismo**:
   - Funciones con el mismo nombre pueden tener diferentes implementaciones en contratos distintos.
3. **Funciones `virtual`**:
   - Permiten que los contratos hijos sobrescriban su comportamiento.
4. **Funciones `override`**:
   - Se utilizan para sobrescribir la implementación de una función `virtual` en el contrato padre.
5. **Ejemplo Práctico**:
   - Creamos una jerarquía entre `Animal` y `Perro`, utilizando `virtual` y `override` para implementar polimorfismo.

---

## Tarea

Crea un contrato llamado `Vehiculo` con una función `mover()` marcada como `virtual`. Luego, crea los contratos `Carro` y `Bicicleta` que hereden de `Vehiculo` e implementen `mover()` con diferentes mensajes.

---

## Próxima Clase

En la próxima clase, exploraremos el uso avanzado de **llamadas externas** para crear sistemas aún más robustos en Solidity. ¡Nos vemos pronto!