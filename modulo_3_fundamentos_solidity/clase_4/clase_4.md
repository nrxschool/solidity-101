# Clase 4: **Tipos de Datos en Solidity (Parte 3)**

## Introducción

¡Hola! Bienvenido a la clase 3.2 de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos los tipos de datos básicos, operadores y estructuras condicionales en Solidity. Hoy profundizaremos en nuestro conocimiento sobre los tipos de datos complejos, específicamente **arrays**, **mappings** y **enums**. Comprender estos tipos es esencial para crear contratos inteligentes más sofisticados y eficientes. ¡Comencemos!

### Agenda:

1. Arrays en Solidity  
2. Mappings  
3. Enums (Enumeraciones)  

---

## 1. Arrays en Solidity

Los **arrays** son estructuras de datos que permiten almacenar colecciones ordenadas de elementos del mismo tipo. Son ampliamente utilizados para gestionar conjuntos de datos dentro de contratos inteligentes.

### Tipos de Arrays

#### Arrays de Tamaño Fijo

- **Definición**: Arrays cuyo tamaño se define en el momento de la declaración y no puede modificarse posteriormente.
- **Sintaxis**:

  ```solidity
  tipo[n] nombreDelArray;
  ```

  Donde `tipo` es el tipo de los elementos y `n` es el número de elementos.

- **Ejemplo**:

  ```solidity
  uint[5] public numerosFijos = [1, 2, 3, 4, 5];
  ```

#### Arrays Dinámicos

- **Definición**: Arrays que no tienen un tamaño predefinido y pueden crecer o disminuir durante la ejecución del contrato.
- **Sintaxis**:

  ```solidity
  tipo[] nombreDelArray;
  ```

- **Ejemplo**:

  ```solidity
  string[] public listaDeNombres;
  ```

### Manipulación de Arrays

- **Agregar Elementos**: Usando el método `push` en arrays dinámicos.

  ```solidity
  function agregarNombre(string memory nombre) public {
      listaDeNombres.push(nombre);
  }
  ```

- **Acceder a Elementos**: Usando el índice (comenzando en 0).

  ```solidity
  function obtenerNombre(uint indice) public view returns (string memory) {
      return listaDeNombres[indice];
  }
  ```

- **Obtener el Tamaño del Array**: Usando la propiedad `length`.

  ```solidity
  function tamanoLista() public view returns (uint) {
      return listaDeNombres.length;
  }
  ```

- **Eliminar Elementos**: En Solidity no hay un método directo para eliminar elementos de un array dinámico. Una práctica común es reasignar valores o manipular índices.

### Ejemplo Completo

```solidity
pragma solidity ^0.8.0;

contract GestorDeNombres {
    string[] public listaDeNombres;

    function agregarNombre(string memory nombre) public {
        listaDeNombres.push(nombre);
    }

    function obtenerNombre(uint indice) public view returns (string memory) {
        require(indice < listaDeNombres.length, "Índice fuera de límites");
        return listaDeNombres[indice];
    }

    function tamanoLista() public view returns (uint) {
        return listaDeNombres.length;
    }
}
```

---

## 2. Mappings

Los **mappings** son estructuras de datos clave-valor que funcionan como tablas hash o diccionarios. Son extremadamente útiles para almacenar y recuperar datos asociados a claves específicas.

### Declaración de Mappings

- **Sintaxis**:

  ```solidity
  mapping(tipoDeClave => tipoDeValor) nombreDelMapping;
  ```

  - `tipoDeClave`: Puede ser cualquier tipo de datos por valor (como `uint`, `address`, `bytes32`), pero no tipos complejos como arrays, mappings o structs.
  - `tipoDeValor`: Puede ser cualquier tipo, incluyendo tipos complejos.

- **Ejemplo**:

  ```solidity
  mapping(address => uint) public saldos;
  ```

### Uso de Mappings

- **Asignar Valores**:

  ```solidity
  function depositar(uint valor) public {
      saldos[msg.sender] += valor;
  }
  ```

- **Recuperar Valores**:

  ```solidity
  function consultarSaldo(address cuenta) public view returns (uint) {
      return saldos[cuenta];
  }
  ```

### Características de los Mappings

- **Inicialización Predeterminada**: Todas las claves posibles existen y apuntan a valores predeterminados (cero, dirección nula, etc.).
- **No Enumerables**: No es posible iterar directamente sobre un mapping para obtener todas las claves o valores almacenados.
- **Combinación con Arrays**: Para rastrear todas las claves utilizadas, es común combinar mappings con arrays.

### Ejemplo Completo

```solidity
pragma solidity ^0.8.0;

contract RegistroDeUsuarios {
    mapping(address => string) public nombres;
    address[] public direcciones;

    function registrarUsuario(string memory nombre) public {
        nombres[msg.sender] = nombre;
        direcciones.push(msg.sender);
    }

    function obtenerNombre(address usuario) public view returns (string memory) {
        return nombres[usuario];
    }

    function totalUsuarios() public view returns (uint) {
        return direcciones.length;
    }
}
```

---

## 3. Enums (Enumeraciones)

Los **enums** son tipos de datos personalizados que permiten definir conjuntos de constantes nombradas. Son útiles para representar estados o fases en un contrato, mejorando la legibilidad y seguridad del código.

### Declaración de Enums

- **Sintaxis**:

  ```solidity
  enum NombreDelEnum { Opcion1, Opcion2, Opcion3 }
  ```

- **Ejemplo**:

  ```solidity
  enum Estado { Inactivo, Activo, Suspendido }
  ```

### Uso de Enums

- **Definiendo Variables Enum**:

  ```solidity
  Estado public estadoActual;
  ```

- **Asignando Valores**:

  ```solidity
  function activar() public {
      estadoActual = Estado.Activo;
  }
  ```

- **Comparando Valores**:

  ```solidity
  function esActivo() public view returns (bool) {
      return estadoActual == Estado.Activo;
  }
  ```

### Ejemplo Completo

```solidity
pragma solidity ^0.8.0;

contract ProcesoDeVenta {
    enum Fase { Creacion, EnProgreso, Finalizado, Cancelado }
    Fase public faseActual;

    constructor() {
        faseActual = Fase.Creacion;
    }

    function iniciarVenta() public {
        require(faseActual == Fase.Creacion, "La venta ya ha iniciado o finalizado.");
        faseActual = Fase.EnProgreso;
    }

    function finalizarVenta() public {
        require(faseActual == Fase.EnProgreso, "La venta no está en progreso.");
        faseActual = Fase.Finalizado;
    }

    function cancelarVenta() public {
        require(faseActual != Fase.Finalizado, "La venta ya ha finalizado.");
        faseActual = Fase.Cancelado;
    }

    function obtenerFaseActual() public view returns (string memory) {
        if (faseActual == Fase.Creacion) return "Creación";
        if (faseActual == Fase.EnProgreso) return "En Progreso";
        if (faseActual == Fase.Finalizado) return "Finalizado";
        if (faseActual == Fase.Cancelado) return "Cancelado";
        return "Fase desconocida";
    }
}
```

---

## Conclusión

En esta clase, exploramos los tipos de datos complejos en Solidity: **arrays**, **mappings** y **enums**. Comprendimos cómo los arrays permiten almacenar colecciones ordenadas de elementos, cómo los mappings nos ayudan a asociar claves a valores, y cómo los enums facilitan la representación de estados u opciones limitadas. Estos tipos de datos son fundamentales para construir contratos inteligentes robustos y eficientes, permitiendo la manipulación avanzada de datos.

---

## Resumen

1. **Arrays**: Estructuras que almacenan colecciones ordenadas de elementos del mismo tipo, con tamaño fijo o dinámico.  
2. **Mappings**: Estructuras clave-valor que permiten asociar claves a valores, muy útiles para almacenamiento y recuperación eficiente de datos.  
3. **Enums**: Tipos personalizados que definen conjuntos de constantes nombradas, ideales para representar estados o fases en un contrato.  

---

## Próxima clase

En la próxima clase, revisaremos la anatomía de un contrato en Solidity.