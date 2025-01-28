# Clase 2: **Tipos de Datos en Solidity (Parte 1)**

## Apertura

¡Hola! Bienvenido a la segunda clase de nuestro curso de Solidity para principiantes. En la clase anterior, exploramos cómo pensar de manera diferente al programar en Solidity y entendimos la filosofía de la orientación a contratos. Hoy, profundizaremos en los **tipos de datos** en Solidity, que son fundamentales para escribir contratos inteligentes efectivos. Comprender los tipos de datos disponibles nos permitirá manipular información de forma correcta y segura.

### Programación:

1. Tipos de Datos Básicos  
2. Direcciones (`address`)  
3. Bytes y Strings  
4. Variables en Solidity  

---

## 1. Tipos de Datos Básicos

En Solidity, los tipos de datos básicos son fundamentales para almacenar y manipular información simple. Vamos a explorar los principales tipos:

### Booleanos (`bool`)

- **Definición**: Representan valores lógicos, pudiendo ser `true` (verdadero) o `false` (falso).  
- **Uso**: Se utilizan en condiciones, control de flujo y banderas (flags).  
- **Ejemplo**:

  ```solidity
  bool public activo = true;
  ```

### Enteros (`int` y `uint`)

#### Enteros Sin Signo (`uint`)

- **Definición**: Números enteros no negativos (cero o positivos).  
- **Tamaños Disponibles**: De `uint8` a `uint256`, en incrementos de 8 bits.  
  - Ejemplo: `uint8`, `uint16`, `uint32`, ..., `uint256`.  
- **Predeterminado**: Si no se especifica, `uint` es equivalente a `uint256`.  
- **Ejemplo**:

  ```solidity
  uint public edad = 30;
  ```

#### Enteros con Signo (`int`)

- **Definición**: Números enteros que pueden ser negativos o positivos.  
- **Tamaños Disponibles**: De `int8` a `int256`, en incrementos de 8 bits.  
  - Ejemplo: `int8`, `int16`, `int32`, ..., `int256`.  
- **Predeterminado**: Si no se especifica, `int` es equivalente a `int256`.  
- **Ejemplo**:

  ```solidity
  int public temperatura = -10;
  ```

### Números de Punto Fijo (`fixed` y `ufixed`)

- **Nota**: Los tipos `fixed` y `ufixed` están en fase experimental y no son ampliamente soportados.  
- **Definición**:  
  - `fixed`: Números de punto fijo con signo.  
  - `ufixed`: Números de punto fijo sin signo.  
- **Uso**: Representan números con decimales.  
- **Ejemplo**:

  ```solidity
  // Aún no soportado completamente
  ```

**Importante**: Debido a la falta de soporte completo, es común utilizar enteros para representar valores monetarios, escalando por factores (como wei para ether).

## 2. Direcciones (`address`)

El tipo `address` es exclusivo de Solidity y es esencial para interactuar con la blockchain de Ethereum.

### Definición

- **`address`**: Representa una dirección Ethereum de 20 bytes.  
- **`address payable`**: Subtipo de `address` que permite operaciones relacionadas con el envío de Ether.  

### Uso

- **Almacenar Direcciones**: Guardar la dirección de una cuenta o contrato.  
- **Enviar Ether**: Usar `address payable` para transferir Ether a otra dirección.  
- **Interactuar con Contratos**: Llamar funciones de otros contratos a través de sus direcciones.  

### Ejemplos

```solidity
address public propietario;
address payable public billetera;

function definirPropietario(address _nuevoPropietario) public {
    propietario = _nuevoPropietario;
}

function enviarPago() public payable {
    billetera.transfer(msg.value);
}
```

## 3. Bytes y Strings

### Bytes (`bytes`)

- **Definición**: Secuencias de bytes que pueden ser de tamaño fijo o dinámico.

#### Bytes de Tamaño Fijo

- **Tipos**: `bytes1`, `bytes2`, ..., `bytes32`.  
- **Uso**: Almacenar datos binarios de tamaño conocido.  
- **Ejemplo**:

  ```solidity
  bytes32 public hash;
  ```

#### Bytes de Tamaño Dinámico

- **Tipo**: `bytes`.  
- **Uso**: Almacenar datos binarios de tamaño variable.  
- **Ejemplo**:

  ```solidity
  bytes public datos;
  ```

### Strings (`string`)

- **Definición**: Secuencias de caracteres en UTF-8 de tamaño dinámico.  
- **Uso**: Almacenar textos legibles.  
- **Limitaciones**: Operaciones avanzadas con strings pueden ser costosas en términos de gas.  
- **Ejemplo**:

  ```solidity
  string public nombre = "Alice";
  ```

**Nota**: Strings y `bytes` de tamaño dinámico se almacenan de manera similar, pero `string` está destinado a datos de texto, mientras que `bytes` es para datos binarios.

## 4. Variables en Solidity

Entender cómo declarar y utilizar variables es fundamental para manipular datos en contratos inteligentes.

### Declaración de Variables

La sintaxis básica para declarar una variable en Solidity es:

```solidity
tipoVisibilidad nombreVariable;
```

- **tipo**: El tipo de datos de la variable (por ejemplo, `uint`, `bool`, `string`).  
- **Visibilidad (opcional)**: `public`, `private`, `internal`, `external`.  
- **nombreVariable**: Identificador de la variable.  

### Asignación de Valores

Se pueden asignar valores a las variables en el momento de la declaración o posteriormente.

#### Asignación en la Declaración

```solidity
uint public contador = 0;
```

#### Asignación Posterior

```solidity
uint public contador;

function incrementar() public {
    contador = contador + 1;
}
```

### Visibilidad de las Variables

- **public**: La variable puede ser accedida internamente y externamente. Se genera un getter automáticamente.  
- **private**: Accesible solo dentro del contrato donde fue declarada.  
- **internal**: Accesible dentro del contrato y en contratos derivados (herencia).  
- **external**: No aplicable a variables de estado, solo a funciones.  

### Ejemplos Completos

```solidity
pragma solidity ^0.8.0;

contract EjemploVariables {
    // Variable pública
    uint public numero;

    // Variable privada
    string private mensaje;

    // Variable interna
    address internal propietario;

    // Función para definir el número
    function definirNumero(uint _nuevoNumero) public {
        numero = _nuevoNumero;
    }

    // Función para definir el mensaje
    function definirMensaje(string memory _nuevoMensaje) public {
        mensaje = _nuevoMensaje;
    }

    // Función para leer el mensaje (no disponible externamente)
    function leerMensaje() internal view returns (string memory) {
        return mensaje;
    }
}
```

## Conclusión

En esta clase, exploramos los tipos de datos básicos en Solidity, incluyendo booleanos, enteros, direcciones, bytes y strings. También aprendimos cómo declarar y utilizar variables, comprendiendo la importancia de los modificadores de visibilidad. Estos fundamentos son esenciales para escribir contratos inteligentes que manipulen datos de forma efectiva y segura.

## Recapitulación

1. **Tipos de Datos Básicos**: `bool`, `int`, `uint`, `fixed`, `ufixed`.  
2. **Direcciones (`address`)**: Representan direcciones de Ethereum y se utilizan para interactuar con la blockchain.  
3. **Bytes y Strings**: Manipulación de datos binarios y texto.  
4. **Variables en Solidity**: Declaración, asignación y visibilidad de variables.  

## Tarea

- **Tarea fácil**:  
  - Declara una variable `bool` llamada `activo` y asígnale el valor `true`.  
- **Tarea media**:  
  - Crea un contrato que almacene el nombre y la edad de una persona y proporcione funciones para actualizar y leer estos valores.  
- **Tarea difícil**:  
  - Implementa un contrato que almacene una dirección `address payable` e incluya una función para enviar Ether a esa dirección.  

## Próxima clase

En la próxima clase, continuaremos explorando los tipos de datos en Solidity, enfocándonos en arrays, structs y mappings. Aprenderemos cómo estos tipos compuestos nos permiten crear estructuras de datos más complejas y poderosas. ¡Hasta entonces!