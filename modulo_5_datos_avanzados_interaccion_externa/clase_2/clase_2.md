# Clase 2: **Contratos Abstractos e Interfaces: Definiendo un Modelo**

## Introducción

¡Bienvenido a la segunda clase del curso de Solidity! En esta clase, exploraremos los **Contratos Abstractos** y las **Interfaces** en Solidity, que son fundamentales para definir modelos y estándares en contratos inteligentes. Los contratos abstractos e interfaces ofrecen flexibilidad para crear contratos extensibles, facilitando la implementación de patrones que ayudan en la interoperabilidad entre diferentes contratos. Aprenderemos cómo utilizarlos para organizar y estructurar mejor nuestros proyectos.

### Contenido:

1. Contratos Abstractos  
2. Interfaces  
3. Diferencias entre Contratos Abstractos e Interfaces  
4. Casos de Uso para Contratos Abstractos e Interfaces  

---

## 1. Contratos Abstractos

### ¿Qué son los Contratos Abstractos?

- **Definición**: Contratos que contienen al menos una función sin implementación (es decir, una función abstracta) y no pueden ser instanciados directamente.  
- **Uso**: Sirven como modelo o base para otros contratos, definiendo una estructura básica y comportamientos que deben ser seguidos.  
- **Características**:
  - Pueden tener funciones con y sin implementación.
  - Pueden incluir variables de estado, constructores y lógica compartida.

### Ejemplo de Contrato Abstracto

```solidity
abstract contract Animal {
    string public nombre;

    function sonido() public virtual pure returns (string memory);
}
```

- **Descripción**: Este contrato abstracto `Animal` define una estructura para cualquier tipo de animal, con una función abstracta `sonido()` que debe ser implementada en contratos derivados.

---

## 2. Interfaces

### ¿Qué son las Interfaces?

- **Definición**: Un tipo especial de contrato que define un conjunto de funciones que deben ser implementadas, pero sin ninguna lógica o implementación propia.  
- **Uso**: Ideal para definir estándares y garantizar que los contratos que siguen la interfaz tengan un conjunto de funciones consistentes, asegurando la interoperabilidad.  
- **Características**:
  - No pueden tener implementaciones de funciones.
  - No pueden tener variables de estado ni constructores.
  - Son útiles para garantizar que diferentes contratos sigan un estándar de interfaz.

### Ejemplo de Interfaz

```solidity
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    // ... otras funciones
}
```

- **Descripción**: Esta interfaz `IERC20` es un ejemplo de estándar para contratos de tokens. Cualquier contrato que implemente `IERC20` debe definir estas funciones, garantizando compatibilidad con el estándar ERC20.

---

## 3. Diferencias entre Contratos Abstractos e Interfaces

| Característica         | Contrato Abstracto                          | Interfaz                              |
|------------------------|---------------------------------------------|---------------------------------------|
| Implementación         | Puede tener funciones con implementación    | No puede tener ninguna implementación|
| Variables de Estado    | Puede tener                                 | No puede tener                       |
| Herencia               | Puede heredar de contratos y interfaces     | Puede heredar de otras interfaces    |
| Constructores          | Puede tener                                 | No puede tener                       |

---

## 4. Casos de Uso para Contratos Abstractos e Interfaces

### ¿Cuándo usar Contratos Abstractos?

- **Propósito**: Definir una estructura base con algunas funciones ya implementadas que pueden ser reutilizadas.  
- **Ejemplo de Aplicación**: Si estás creando una jerarquía donde deseas que algunos contratos compartan lógica básica, pero cada contrato derivado defina su propio comportamiento específico para ciertas funciones.

### ¿Cuándo usar Interfaces?

- **Propósito**: Definir un conjunto de funciones que diferentes contratos deben implementar, garantizando un estándar común.  
- **Ejemplo de Aplicación**: Crear un estándar de token (como ERC20) donde cualquier contrato que implemente esta interfaz sea compatible con dicho estándar.

---

## Conclusión

En esta clase, vimos cómo los **Contratos Abstractos** y las **Interfaces** son herramientas valiosas para definir modelos y estándares en Solidity. Los contratos abstractos nos permiten crear modelos que los contratos derivados deben extender e implementar, permitiendo la creación de estructuras modulares y reutilizables. Por otro lado, las interfaces garantizan que diferentes contratos sigan estándares específicos, esenciales para la interoperabilidad en aplicaciones descentralizadas.

Con estos conceptos, puedes estructurar mejor tus contratos, facilitando el mantenimiento y asegurando que sigan los estándares de la industria.

---

## Resumen

1. **Contratos Abstractos**:
   - Definen una estructura base y pueden tener algunas implementaciones de funciones.
2. **Interfaces**:
   - Definen un conjunto de funciones sin implementación, garantizando un estándar común.
3. **Diferencias entre Contratos Abstractos e Interfaces**:
   - Los contratos abstractos pueden tener implementaciones, variables de estado y constructores; las interfaces no.
4. **Casos de Uso**:
   - Contratos Abstractos para herencia con lógica compartida.
   - Interfaces para garantizar interoperabilidad y estándares comunes entre contratos.

---

## Tarea

Crea un contrato abstracto llamado `Vehiculo` con una función `mover()`. Luego, crea un contrato `Coche` que herede de `Vehiculo` e implemente la función `mover()` para que retorne `"El coche se está moviendo"`. Después, crea una interfaz llamada `IVehiculo` con la función `mover()` y haz que el contrato `Coche` implemente también esta interfaz.

---

## Próxima Clase

En la próxima clase, aprenderemos sobre **Herencia** en Solidity.