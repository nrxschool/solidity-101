# Clase 4: **Escribiendo Código Seguro**

## Introducción

¡Hola! Bienvenido a la Clase 4.4 de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos funciones, eventos y otras funcionalidades importantes de Solidity. Hoy nos enfocaremos en un aspecto crucial del desarrollo de contratos inteligentes: **Escribir Código Seguro**.

Los errores en los contratos inteligentes pueden tener consecuencias graves, como la pérdida de fondos, vulnerabilidades de seguridad y daños a la reputación. En esta clase, aprenderemos técnicas para aumentar la seguridad de tus contratos, incluyendo validación de entrada, manejo de errores y el uso de modificadores. Comprender y aplicar estas prácticas es esencial para desarrollar contratos robustos y confiables en la red Ethereum.

### Contenido:

1. Escribiendo Código Seguro  
2. Validación y Manejo de Errores  
3. Modificadores  

---

## 1. Escribiendo Código Seguro

### Importancia de la Seguridad en Contratos Inteligentes

- **Consecuencias de los Errores**:
  - **Pérdida de Fondos**: Contratos con errores pueden permitir que atacantes roben o bloqueen fondos.
  - **Fallas de Seguridad**: Las vulnerabilidades pueden ser explotadas para alterar el comportamiento del contrato.
  - **Daños a la Reputación**: Los errores pueden minar la confianza de los usuarios y de la comunidad.

### Técnicas para Mejorar la Seguridad

- **Validación de Entrada**: Verificar cuidadosamente los datos proporcionados por los usuarios.
- **Manejo de Errores**: Manejar adecuadamente condiciones inesperadas o excepciones.
- **Uso de Modificadores**: Reutilizar lógica común para validación y control de acceso.
- **Auditorías de Código**: Revisar el código para identificar y corregir vulnerabilidades.
- **Buenas Prácticas de Programación**: Seguir estándares reconocidos para escribir código claro y seguro.

---

## 2. Validación y Manejo de Errores

La validación de entrada y el manejo de errores son fundamentales para evitar comportamientos indeseados en contratos inteligentes.

### 2.1 `require`

- **Descripción**: Verifica si una condición es verdadera. Si no lo es, revierte la transacción con un mensaje de error.
- **Uso Común**:
  - Validar parámetros de función.
  - Garantizar que se cumplan ciertas condiciones previas.
- **Sintaxis**:

  ```solidity
  require(condicion, "Mensaje de error");
  ```

- **Ejemplo**:

  ```solidity
  function transferir(address _destinatario, uint _valor) public {
      require(saldo[msg.sender] >= _valor, "Saldo insuficiente.");
      saldo[msg.sender] -= _valor;
      saldo[_destinatario] += _valor;
  }
  ```

### 2.2 `assert`

- **Descripción**: Verifica si una condición es verdadera. Si no lo es, causa un error irrecuperable (panic) y consume todo el gas restante.
- **Uso Común**:
  - Detectar errores internos y condiciones que nunca deberían ocurrir.
  - Garantizar invariantes del contrato.
- **Sintaxis**:

  ```solidity
  assert(condicion);
  ```

- **Ejemplo**:

  ```solidity
  function incrementarContador() public {
      contador += 1;
      assert(contador > 0); // El contador nunca debe ser negativo
  }
  ```

- **Nota**: `assert` debe usarse con cuidado, ya que consume todo el gas de la transacción cuando falla.

### 2.3 `revert`

- **Descripción**: Revierte la transacción inmediatamente, opcionalmente con un mensaje de error.
- **Uso Común**:
  - Cuando se necesitan verificar múltiples condiciones.
  - Para simplificar la lectura del código.
- **Sintaxis**:

  ```solidity
  revert("Mensaje de error");
  ```

- **Ejemplo**:

  ```solidity
  function comprar(uint _cantidad) public payable {
      if (_cantidad > stock) {
          revert("Cantidad solicitada excede el stock disponible.");
      }
      // Procesar la compra
  }
  ```

### 2.4 `try/catch`

- **Descripción**: Permite capturar y manejar errores en llamadas externas a otros contratos.
- **Uso Común**:
  - Manejar excepciones al interactuar con otros contratos.
  - Implementar lógica alternativa en caso de fallo.
- **Sintaxis**:

  ```solidity
  try contratoExterno.funcion() {
      // Éxito
  } catch {
      // Falla
  }
  ```

- **Ejemplo**:

  ```solidity
  function llamarContratoExterno(address _direccionContrato) public {
      ContratoExterno contrato = ContratoExterno(_direccionContrato);
      try contrato.funcionExterna() {
          // Llamada exitosa
      } catch {
          // Manejar la falla
          revert("Error al llamar al contrato externo.");
      }
  }
  ```

---

## 3. Modificadores

Los modificadores son bloques de código que alteran el comportamiento de funciones, permitiendo añadir lógica antes y/o después de la ejecución de la función objetivo.

### 3.1 ¿Qué son los Modificadores?

- **Definición**: Funciones que modifican el comportamiento de otras funciones.
- **Uso**:
  - **Validar Entrada**: Verificar condiciones antes de ejecutar la función.
  - **Controlar Acceso**: Restringir quién puede llamar a la función.
  - **Reutilizar Código**: Evitar repetición de código en múltiples funciones.

### 3.2 Sintaxis de un Modificador

```solidity
modifier nombreDelModificador() {
    // Código a ejecutar antes
    _;
    // Código a ejecutar después (opcional)
}
```

- **`_`**: Representa el punto donde se insertará el cuerpo de la función modificada.

### 3.3 Ejemplos

#### Ejemplo 1: Modificador `onlyOwner` para Control de Acceso

```solidity
contract MiContrato {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar esta función.");
        _;
    }

    function funcionRestringida() public onlyOwner {
        // Código que solo el propietario puede ejecutar
    }
}
```

#### Ejemplo 2: Modificador para Validar Entrada

```solidity
modifier valorMinimo(uint _valorMinimo) {
    require(msg.value >= _valorMinimo, "Valor insuficiente.");
    _;
}

function comprar() public payable valorMinimo(1 ether) {
    // Procesar la compra
}
```

---

## Conclusión

En esta clase, abordamos la importancia de escribir código seguro en Solidity. Aprendimos sobre técnicas esenciales como validación de entrada, manejo de errores y uso de modificadores para controlar el flujo y acceso a las funciones. Escribir código seguro no es solo una recomendación, sino una necesidad en el desarrollo de contratos inteligentes para proteger los fondos y datos de los usuarios.

---

## Resumen

1. **Escribiendo Código Seguro**:
   - Importancia de prevenir errores y vulnerabilidades en contratos inteligentes.
   - Técnicas para mejorar la seguridad, como validación de entrada, manejo de errores y uso de modificadores.
2. **Validación y Manejo de Errores**:
   - Uso de `require`, `assert`, `revert` y `try/catch`.
3. **Modificadores**:
   - Creación de modificadores para validar entrada, controlar acceso y reutilizar código.

---

## Tarea
Crea un contrato llamado `RegistroSeguro` que permita a los usuarios almacenar un mensaje. Usa `require` para validar que el mensaje no esté vacío.

---

## Próximo Módulo

En el próximo módulo exploraremos estructuras de datos avanzadas e interacciones externas en Solidity.  
