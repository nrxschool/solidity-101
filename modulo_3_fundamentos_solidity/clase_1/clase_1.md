# Clase 1: **Solidity: Pensando Diferente**

## Apertura

¡Hola! Bienvenido a la clase 3.1 de nuestro curso de Solidity para principiantes. Hasta ahora, hemos explorado los fundamentos de la blockchain, los contratos inteligentes y hemos creado nuestra primera wallet. Hoy, profundizaremos en el lenguaje Solidity y entenderemos cómo se diferencia de los lenguajes de programación tradicionales. Descubriremos cómo pensar de manera diferente al programar contratos inteligentes y exploraremos la filosofía de la orientación a contratos. ¡Vamos a ello!

### Programación:

1. Solidity: Una Nueva Perspectiva  
2. Comparando Contratos con Programas Tradicionales  
3. La Filosofía de la Orientación a Contratos  
4. Encapsulación, Herencia y Polimorfismo en Solidity  

---

## 1. Solidity: Una Nueva Perspectiva

Solidity es un lenguaje de programación creado específicamente para el desarrollo de contratos inteligentes en la blockchain de Ethereum. Presenta paradigmas distintos en comparación con los lenguajes de programación tradicionales, requiriendo un cambio de perspectiva por parte de los desarrolladores.

### Características de Solidity:

- **Orientado a Contratos**: Se enfoca en los contratos inteligentes como unidades fundamentales de código.  
- **Precisión y Prevención de Errores**: Debido al entorno inmutable de la blockchain, los errores pueden ser costosos e irreversibles.  
- **Ejecución Descentralizada**: El código se ejecuta en un entorno distribuido, la Ethereum Virtual Machine (EVM).  
- **Costo de Ejecución (Gas)**: Cada operación tiene un costo asociado, incentivando la escritura de código optimizado.  

### Cambio de Perspectiva:

- **Inmutabilidad**: A diferencia de las aplicaciones tradicionales, una vez implementado, el código de un contrato inteligente no puede ser modificado.  
- **Transacciones**: La interacción con los contratos se realiza a través de transacciones que modifican el estado de la blockchain.  
- **Seguridad como Prioridad**: La protección contra vulnerabilidades es crucial, ya que los contratos mal diseñados pueden causar pérdidas financieras significativas.  

## 2. Comparando Contratos con Programas Tradicionales

Aunque comparten similitudes con los programas tradicionales, los contratos inteligentes tienen diferencias fundamentales:

| Característica            | Programas Tradicionales                      | Contratos Inteligentes                                   |
|---------------------------|----------------------------------------------|---------------------------------------------------------|
| **Ejecución**             | Centralizada                                 | Descentralizada                                         |
| **Estado**                | Memoria volátil                              | Persistente en la blockchain                            |
| **Interacción Externa**   | APIs, bibliotecas                            | Transacciones                                           |
| **Entorno de Ejecución**  | Sistemas operativos, servidores, nube        | Ethereum Virtual Machine (EVM)                         |
| **Inmutabilidad**         | Código puede ser modificado y actualizado    | Código inmutable tras implementación                    |
| **Almacenamiento de Datos**| Bases de datos, archivos, etc.              | Almacenamiento de estado en la blockchain               |
| **Seguridad**             | Buenas prácticas, firewalls, etc.            | Auditorías, programación defensiva, bibliotecas seguras |
| **Costos de Ejecución**   | Uso de recursos computacionales y almacenamiento | Gas en la red Ethereum                               |

## 3. La Filosofía de la Orientación a Contratos

La programación en Solidity sigue la filosofía de la orientación a contratos, que comparte conceptos con la programación orientada a objetos, pero con adaptaciones específicas para el entorno de contratos inteligentes.

### Encapsulación:

- **Definición**: Agrupar datos y funciones que operan sobre esos datos dentro de un contrato.  
- **En Solidity**:  
  - **Funciones**: Se utilizan para interactuar con los datos del contrato de manera controlada.  

### Herencia:

- **Definición**: Permite que un contrato herede propiedades y métodos de otro contrato.  

### Polimorfismo:

- **Definición**: Capacidad de diferentes contratos para implementar funciones con el mismo nombre, pero con comportamientos distintos.  

## 4. Encapsulación, Herencia y Polimorfismo en Solidity

### Encapsulación en la Práctica:

```solidity
pragma solidity ^0.8.0;

contract Caja {
    uint private saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}
```

- **Análisis**:
  - **Variable `saldo`**: Declarada como `private`, solo puede ser accedida dentro del contrato.
  - **Funciones Públicas**: `depositar` y `consultarSaldo` permiten interactuar con `saldo` de forma controlada.

### Herencia en la Práctica:

```solidity
contract Caja {
    uint private saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}

contract CajaPremium is Caja {
    function bonus() public {
        saldo += 100; // Error: `saldo` es `private` en el contrato padre y no se puede acceder desde contratos hijos.
    }
}
```

- **Nota**: El ejemplo anterior generará un error, ya que `saldo` es `private` y no puede ser accedido por contratos hijos. Para permitir el acceso, `saldo` debe ser declarado como `protected` o `internal`.

```solidity
contract Caja {
    uint internal saldo;

    function depositar(uint valor) public {
        saldo += valor;
    }

    function consultarSaldo() public view returns (uint) {
        return saldo;
    }
}

contract CajaPremium is Caja {
    function bonus() public {
        saldo += 100; // Ahora es posible acceder a `saldo` desde el contrato hijo.
    }
}
```

### Polimorfismo en la Práctica:

```solidity
contract Calculadora {
    function calcular(uint a, uint b) public pure virtual returns (uint) {
        return a + b;
    }
}

contract CalculadoraAvanzada is Calculadora {
    function calcular(uint a, uint b) public pure override returns (uint) {
        return a * b;
    }
}
```

- **Análisis**:
  - **Función `calcular`**: Declarada como `virtual` en `Calculadora` y `override` en `CalculadoraAvanzada`.
  - **Comportamiento Diferente**: `Calculadora` suma los números, mientras que `CalculadoraAvanzada` los multiplica.

## Conclusión

En esta clase, introdujimos el lenguaje Solidity y sus paradigmas, comparándolo con lenguajes de programación tradicionales. Exploramos cómo la filosofía de orientación a contratos se diferencia de la programación tradicional y cómo conceptos como encapsulación, herencia y polimorfismo se implementan en Solidity. Comprender estas diferencias es crucial para desarrollar contratos inteligentes seguros y eficientes.

## Recapitulación

1. **Solidity: Una Nueva Perspectiva**: Un lenguaje específico para contratos inteligentes que requiere una nueva forma de pensar.
2. **Comparando Contratos con Programas Tradicionales**: Entendimos las principales diferencias e implicaciones.
3. **La Filosofía de la Orientación a Contratos**: Exploramos conceptos clave adaptados para contratos inteligentes.
4. **Encapsulación, Herencia y Polimorfismo en Solidity**: Vimos cómo estos conceptos se aplican en la práctica.

## Tarea

Investiga sobre los modificadores de acceso en Solidity y enuméralos con una breve descripción.

## Próxima clase

En la próxima clase, hablaremos sobre los tipos de datos en Solidity.