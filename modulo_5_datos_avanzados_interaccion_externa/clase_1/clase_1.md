# Clase 1: **Tipos de Datos Complejos: Structs**

## Introducción

¡Hola! Bienvenido a la quinta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos variables, funciones, eventos y técnicas para escribir código seguro. Hoy profundizaremos en los **tipos de datos complejos** en Solidity, con un enfoque especial en las **structs**. Las structs son herramientas poderosas que permiten organizar y representar datos de forma estructurada dentro de tus contratos inteligentes. Con ellas, puedes crear modelos de datos más ricos y expresivos, facilitando la gestión de información compleja.

### Agenda:

1. Tipos de Datos Complejos en Solidity  
2. Structs  
3. Structs en Arrays y Mappings  
4. Uso de Structs en Funciones  

---

## 1. Tipos de Datos Complejos en Solidity

### Descripción General

Solidity ofrece tipos de datos complejos que permiten representar estructuras de datos más elaboradas. Además de los tipos básicos (`uint`, `bool`, `address`, etc.), tenemos:

- **Structs**: Conjuntos personalizados de variables agrupadas bajo un único nombre.

---

## 2. Introducción a las Structs

### ¿Qué son las Structs?

- **Definición**: Una `struct` es una estructura que permite agrupar variables de diferentes tipos bajo un único nombre.
- **Uso**: Ideal para representar objetos o entidades con múltiples atributos, como usuarios, productos, transacciones, etc.

### Características de las Structs

- Pueden contener variables de cualquier tipo, incluidos tipos básicos, arrays e incluso otras structs.
- Se definen dentro del contrato y se pueden utilizar como tipos personalizados.
- Facilitan la organización de datos complejos.

---

## 3. Declarando Structs

### Sintaxis Básica

```solidity
struct NombreDeLaStruct {
    tipo variable1;
    tipo variable2;
    // ... más variables
}
```

- **`struct`**: Palabra clave para declarar una nueva struct.
- **`NombreDeLaStruct`**: El nombre que eliges para tu struct.
- **Variables**: Lista de variables con sus tipos y nombres.

### Ejemplo de Declaración

```solidity
struct Producto {
    string nombre;
    uint256 precio;
    bool disponible;
}
```

- **Descripción**: Creamos una struct `Producto` con tres atributos:
  - `nombre`: El nombre del producto (`string`).
  - `precio`: El precio del producto en wei (`uint256`).
  - `disponible`: Indica si el producto está disponible para la venta (`bool`).

---

## 4. Usando Structs en Variables

### Declarando Variables del Tipo Struct

Después de declarar una struct, podemos crear variables de ese tipo.

#### Variable de Estado

```solidity
Producto public miProducto;
```

- **Descripción**: Declara una variable pública de estado llamada `miProducto` del tipo `Producto`.

#### Variable Local

Dentro de funciones, podemos declarar variables locales del tipo struct.

```solidity
function crearProducto() public {
    Producto memory nuevoProducto;
    // ...
}
```

- **Nota**: Usamos `memory` para indicar que la variable se almacena temporalmente en memoria durante la ejecución de la función.

### Inicializando Structs

#### Método 1: Usando Parámetros

```solidity
producto = Producto("Camiseta", 1000, true);
```

- **Descripción**: Inicializa la variable `producto` con valores específicos.

#### Método 2: Asignando Valores Directamente

```solidity
Producto memory productoTemp;
productoTemp.nombre = "Camiseta";
productoTemp.precio = 1000;
productoTemp.disponible = true;
```

- **Descripción**: Asigna valores a los miembros individualmente.

---

## 5. Accediendo y Modificando Miembros de la Struct

### Operador Punto (`.`)

Usamos el operador punto para acceder y modificar los miembros de la struct.

#### Ejemplo de Acceso

```solidity
string memory nombreProducto = miProducto.nombre;
uint precioProducto = miProducto.precio;
bool estaDisponible = miProducto.disponible;
```

#### Ejemplo de Modificación

```solidity
miProducto.precio = 1200;
miProducto.disponible = false;
```

---

## 6. Structs en Arrays y Mappings

### Array de Structs

Podemos crear arrays que almacenen múltiples structs.

#### Declaración

```solidity
Producto[] public productos;
```

- **Descripción**: Declara un array dinámico público de `Producto`.

#### Añadiendo Structs al Array

```solidity
function añadirProducto(string memory _nombre, uint256 _precio) public {
    productos.push(Producto(_nombre, _precio, true));
}
```

### Mapping de Structs

Podemos mapear claves a structs.

#### Declaración

```solidity
mapping(uint256 => Producto) public productos;
```

- **Descripción**: Mapea un `uint256` (por ejemplo, un ID) a un `Producto`.

#### Asignación

```solidity
function añadirProducto(uint256 _id, string memory _nombre, uint256 _precio) public {
    productos[_id] = Producto(_nombre, _precio, true);
}
```

---

## 7. Uso de Structs en Funciones

### Pasando Structs como Parámetros

Podemos pasar structs como parámetros a funciones.

#### Ejemplo

```solidity
function actualizarProducto(uint256 _id, Producto memory _productoActualizado) public {
    productos[_id] = _productoActualizado;
}
```

- **Nota**: Al pasar structs, es importante especificar `memory` o `storage` según sea necesario.

### Retornando Structs de Funciones

Podemos retornar structs de funciones.

#### Ejemplo

```solidity
function obtenerProducto(uint256 _id) public view returns (Producto memory) {
    return productos[_id];
}
```

---

## Conclusión

En esta clase, exploramos los **tipos de datos complejos** en Solidity, con un enfoque en las **structs**. Aprendimos a declarar structs, crear variables de tipo struct, acceder y modificar sus miembros, y usar structs en arrays y mappings. También desarrollamos un ejemplo práctico de un sistema de registro de productos, demostrando cómo aplicar estos conceptos en un contrato real.

---

## Resumen

1. **Tipos de Datos Complejos**: Arrays, mappings y structs.  
2. **Structs**: Agrupan variables de diferentes tipos en una única unidad.  
3. **Declaración de Structs**: Usamos la sintaxis `struct NombreDeLaStruct { ... }`.  
4. **Variables de Tipo Struct**: Declaradas como variables de estado o locales.  
5. **Acceso y Modificación**: Usamos el operador punto (`.`).  
6. **Structs en Arrays y Mappings**: Gestión eficiente de múltiples entidades.  
7. **Structs en Funciones**: Como parámetros y valores de retorno.  

---

## Tarea

Crea un contrato llamado `RegistroDePersonas` que utilice una struct `Persona` con los atributos `nombre`, `edad` y `direccion`. Incluye funciones para añadir una nueva persona y obtener sus datos por nombre.

---

## Próxima Clase

En la próxima clase, exploraremos el concepto de **Contratos Abstractos e Interfaces**. ¡Nos vemos allí!