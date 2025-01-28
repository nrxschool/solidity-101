# Clase 5: **Modificadores de Función en Solidity**

## Introducción

Bienvenido a la quinta clase de nuestro curso de Solidity para principiantes. Hoy exploraremos en profundidad los **modificadores de función** en Solidity. Los modificadores son herramientas poderosas que permiten alterar el comportamiento de las funciones, añadiendo capas de verificación, control de acceso y reutilización de código. Comprender y utilizar modificadores de forma efectiva es esencial para escribir contratos inteligentes seguros y eficientes.

### Contenido:

1. ¿Qué son los Modificadores de Función?  
2. Sintaxis y Estructura de los Modificadores  
3. Aplicaciones Comunes de los Modificadores  
4. Modificadores con Parámetros  
5. Encadenamiento de Modificadores  
6. Buenas Prácticas en el Uso de Modificadores  

---

## 1. ¿Qué son los Modificadores de Función?

Los modificadores de función son bloques de código que pueden aplicarse a funciones para alterar o extender su comportamiento. Permiten ejecutar código antes y/o después de la ejecución de la función objetivo, sin necesidad de duplicar lógica en múltiples funciones.

**Principales usos de los modificadores:**

- **Control de Acceso**: Restringir quién puede llamar a una función específica.  
- **Validación de Entradas**: Verificar condiciones o requisitos previos antes de ejecutar la función.  
- **Protección contra Reentradas**: Prevenir ataques de reentrada en contratos inteligentes.  

---

## 2. Sintaxis y Estructura de los Modificadores

La declaración de un modificador utiliza la palabra clave `modifier`, seguida por el nombre del modificador y, opcionalmente, parámetros. El cuerpo del modificador contiene la lógica a ejecutar y el carácter especial `_`, que indica dónde se insertará el cuerpo de la función modificada.

**Estructura básica:**

```solidity
modifier nombreDelModificador() {
    // Lógica antes de la ejecución de la función
    _;
    // Lógica después de la ejecución de la función (opcional)
}
```

**Ejemplo:**

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Solo el propietario puede ejecutar esta función.");
    _;
}
```

En este ejemplo, el modificador `onlyOwner` verifica si quien llama a la función es el propietario del contrato antes de permitir la ejecución de la función.

---

## 3. Aplicaciones Comunes de los Modificadores

### 3.1 Control de Acceso

Uno de los usos más comunes de los modificadores es restringir el acceso a funciones sensibles.

**Ejemplo:**

```solidity
contract MiContrato {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede ejecutar esta función.");
        _;
    }

    function funcionRestringida() public onlyOwner {
        // Lógica de la función
    }
}
```

Aquí, la función `funcionRestringida` solo puede ser llamada por el propietario del contrato.

### 3.2 Validación de Entradas

Los modificadores pueden validar parámetros o condiciones antes de ejecutar una función.

**Ejemplo:**

```solidity
modifier valorMinimo(uint256 _valor) {
    require(msg.value >= _valor, "El valor enviado es insuficiente.");
    _;
}

function comprar() public payable valorMinimo(1 ether) {
    // Lógica de la función
}
```

En este caso, la función `comprar` solo se ejecutará si el valor enviado es igual o mayor a 1 ether.

### 3.3 Protección contra Reentradas

Los modificadores pueden prevenir ataques de reentrada, que ocurren cuando se llama a una función externa antes de completar la ejecución de la función original.

**Ejemplo:**

```solidity
bool private locked;

modifier noReentrancy() {
    require(!locked, "No se permite reentrada.");
    locked = true;
    _;
    locked = false;
}

function retirar(uint256 _cantidad) public noReentrancy {
    require(saldo[msg.sender] >= _cantidad, "Saldo insuficiente.");
    saldo[msg.sender] -= _cantidad;
    payable(msg.sender).transfer(_cantidad);
}
```

El modificador `noReentrancy` evita que la función `retirar` se llame nuevamente antes de su finalización, previniendo ataques de reentrada.

---

## 4. Modificadores con Parámetros

Los modificadores pueden aceptar parámetros, lo que permite una mayor flexibilidad y reutilización de código.

**Ejemplo:**

```solidity
modifier soloMayorDeEdad(uint256 _edadMinima) {
    require(edad[msg.sender] >= _edadMinima, "Edad insuficiente.");
    _;
}

function accederContenidoAdulto() public soloMayorDeEdad(18) {
    // Lógica de la función
}
```

Aquí, el modificador `soloMayorDeEdad` verifica si el usuario tiene la edad mínima requerida antes de permitir el acceso a la función.

---

## 5. Encadenamiento de Modificadores

Es posible aplicar múltiples modificadores a una única función, lo que permite combinar diferentes verificaciones y lógicas.

**Ejemplo:**

```solidity
modifier soloEnHorarioComercial() {
    require(block.timestamp % 1 days >= 9 hours && block.timestamp % 1 days <= 17 hours, "Fuera del horario comercial.");
    _;
}

function realizarTransaccion() public onlyOwner soloEnHorarioComercial {
    // Lógica de la función
}
```

En este ejemplo, la función `realizarTransaccion` solo puede ejecutarse por el propietario y durante el horario comercial.

---

## 6. Buenas Prácticas en el Uso de Modificadores

- **Claridad**: Utiliza nombres descriptivos para los modificadores, indicando claramente su propósito.  
- **Simplicidad**: Mantén la lógica de los modificadores sencilla y directa.  
- **Reutilización**: Aprovecha los modificadores para evitar la duplicación de código en múltiples funciones.  
- **Seguridad**: Usa modificadores para implementar verificaciones de seguridad y prevenir vulnerabilidades.  

---

## Conclusión

En esta clase, exploramos los modificadores de función en Solidity, entendiendo su sintaxis, aplicaciones comunes y cómo usarlos para escribir contratos inteligentes más seguros.

---

## Próximo módulo

En el próximo módulo hablaremos sobre estructuras de datos avanzadas e interacciones externas en Solidity.  
