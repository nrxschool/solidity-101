# Clase 1: **Funciones en Solidity**

## Introducción

¡Hola! Bienvenido a la Clase 1 de nuestro curso de Solidity para principiantes. Hasta ahora, hemos explorado los tipos de datos, la estructura básica de un contrato y las variables en Solidity. Hoy profundizaremos en uno de los conceptos más fundamentales de la programación de contratos inteligentes: las **funciones**.

Las funciones son bloques de código reutilizables que realizan tareas específicas y son esenciales para interactuar con tus contratos. Permiten modificar el estado del contrato, leer datos de la blockchain, recibir y enviar Ether, entre otras operaciones. En esta clase, aprenderemos cómo declarar y usar funciones en Solidity, incluyendo el uso del constructor para inicializar el contrato.

### Agenda:

1. ¿Qué son las Funciones en Solidity?  
2. Sintaxis Básica de una Función  
3. Modificadores de Visibilidad  
4. Funciones `view`, `pure` y `payable`  
5. El Constructor en Solidity  
6. Ejemplos Prácticos  

---

## 1. ¿Qué son las Funciones en Solidity?

Las **funciones** son bloques de código que realizan tareas específicas dentro de un contrato inteligente. Son fundamentales para estructurar el código de manera organizada y eficiente, permitiendo:

- **Reutilización de Código**: Evita la repetición, haciendo que el contrato sea más limpio y fácil de mantener.  
- **Modularidad**: Facilita la lectura y comprensión del código, separando funcionalidades en unidades lógicas.  
- **Interacción Externa**: Permite que usuarios y otros contratos interactúen con el contrato llamando funciones específicas.  

### Las Funciones Pueden:

- **Modificar el Estado del Contrato**: Alterar valores de variables de estado, añadir o eliminar datos, entre otros.  
- **Leer Datos de la Blockchain**: Acceder a información almacenada en el contrato o en variables globales.  
- **Recibir y Enviar Ether**: Gestionar transacciones financieras dentro de la red Ethereum.  

---

## 2. Sintaxis Básica de una Función

La declaración de una función en Solidity sigue una sintaxis específica:

```solidity
function nombreFuncion(tipoParametro nombreParametro, ...) modificadores visibilidad returns (tipoRetorno) {
    // Cuerpo de la función
}
```

### Componentes de la Sintaxis:

- **`function`**: Palabra clave que indica el inicio de una función.  
- **`nombreFuncion`**: Identificador único de la función.  
- **Parámetros**: Lista de tipos y nombres de parámetros de entrada.  
- **Modificadores**: Palabras clave que alteran el comportamiento de la función (e.g., `view`, `pure`, `payable`).  
- **Visibilidad**: Define quién puede llamar a la función (`public`, `private`, `internal`, `external`).  
- **`returns`**: Especifica el tipo de dato que devuelve la función.  
- **Cuerpo de la Función**: Bloque de código que define el comportamiento de la función.  

### Ejemplo Sencillo:

```solidity
function suma(uint a, uint b) public pure returns (uint) {
    return a + b;
}
```

- **Descripción**: Una función pública que recibe dos números enteros y devuelve su suma. La función es `pure` porque no accede ni modifica el estado del contrato.  

---

## 3. Modificadores de Visibilidad

La visibilidad de una función determina quién puede llamarla. Hay cuatro tipos de visibilidad en Solidity:

### 3.1 `public`

- **Accesible**: Desde dentro y fuera del contrato.  
- **Uso**: Funciones que deben ser llamadas por usuarios externos u otros contratos.  
- **Comportamiento**: Crea una interfaz pública para la función.  

**Ejemplo:**

```solidity
function actualizarSaldo(uint nuevoSaldo) public {
    saldo = nuevoSaldo;
}
```

### 3.2 `private`

- **Accesible**: Solo desde dentro del contrato donde fue declarada.  
- **Uso**: Funciones auxiliares que no deben exponerse externamente.  
- **Comportamiento**: Oculta la función de contratos externos y contratos derivados.  

**Ejemplo:**

```solidity
function _calcularTasa(uint valor) private pure returns (uint) {
    return valor * 5 / 100;
}
```

### 3.3 `internal`

- **Accesible**: Desde dentro del contrato y de contratos que heredan de él.  
- **Uso**: Funciones que pueden ser utilizadas por contratos hijos.  
- **Comportamiento**: Similar a `private`, pero permite acceso en contratos derivados.  

**Ejemplo:**

```solidity
function multiplicar(uint a, uint b) internal pure returns (uint) {
    return a * b;
}
```

### 3.4 `external`

- **Accesible**: Solo desde fuera del contrato.  
- **Uso**: Funciones que se llaman externamente, pero no internamente.  
- **Comportamiento**: Optimiza el uso de gas para llamadas externas.  

**Ejemplo:**

```solidity
function obtenerDatos() external view returns (uint, address) {
    return (datos, msg.sender);
}
```

---

## 4. Funciones `view`, `pure` y `payable`

### 4.1 Funciones `view`

- **Definición**: Funciones que **acceden** al estado del contrato, pero **no lo modifican**.  
- **Uso**: Leer valores de variables de estado sin alterar nada.  

**Ejemplo:**

```solidity
function consultarSaldo() public view returns (uint) {
    return saldo;
}
```

### 4.2 Funciones `pure`

- **Definición**: Funciones que **no acceden** ni **modifican** el estado del contrato.  
- **Uso**: Realizar cálculos que solo dependen de parámetros de entrada o variables locales.  

**Ejemplo:**

```solidity
function calcularCuadrado(uint x) public pure returns (uint) {
    return x * x;
}
```

### 4.3 Funciones `payable`

- **Definición**: Funciones que pueden **recibir Ether** durante su ejecución.  
- **Uso**: Necesarias para funciones que aceptan pagos o depósitos de Ether.  

**Ejemplo:**

```solidity
function recibirPago() public payable {
    emit PagoRecibido(msg.sender, msg.value);
}
```

---

## 5. El Constructor en Solidity

El **constructor** es una función especial que se ejecuta una sola vez, al momento de desplegar el contrato. Se usa para inicializar variables de estado y definir configuraciones iniciales.  

### Características del Constructor:

- **Nombre**: `constructor` (a partir de Solidity 0.4.22).  
- **Visibilidad**: No requiere especificar `public` o `private`.  
- **Parámetros**: Puede aceptar parámetros para configurar el contrato durante el despliegue.  
- **Ejecución Única**: Solo se ejecuta una vez.  

**Ejemplo:**

```solidity
contract MiContrato {
    address public owner;
    uint public tasa;

    constructor(uint _tasa) {
        owner = msg.sender; // Define al creador del contrato como propietario
        tasa = _tasa;       // Inicializa la tasa con el valor proporcionado
    }
}
```

---

## Conclusión

En esta clase, profundizamos en las funciones en Solidity. Aprendimos cómo declarar y usar funciones, entendiendo los modificadores de visibilidad (`public`, `private`, `internal`, `external`) y las funciones especiales (`view`, `pure`, `payable`). También exploramos el uso del constructor para inicializar contratos con ejemplos prácticos que ilustran su aplicación.  

---

## Tarea

Crea un contrato llamado `Calculadora` con funciones `suma`, `resta`, `multiplicacion` y `division`, todas como funciones `pure`.  

---

## Próxima Clase

En la próxima clase, exploraremos **eventos** en Solidity. ¡Prepárate para profundizar aún más tus conocimientos en Solidity!  