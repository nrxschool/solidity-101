# Clase 5: **Control de Acceso Basado en Roles (RBAC)**

## Introducción

¡Bienvenido a nuestra clase sobre Control de Acceso Basado en Roles (RBAC) en Solidity! Hasta ahora, has aprendido sobre seguridad y cómo crear contratos seguros y bien estructurados. Hoy abordaremos una técnica fundamental para proteger tu contrato: **Control de Acceso Basado en Roles (RBAC)**. Este mecanismo de seguridad permite restringir el acceso a ciertas funcionalidades del contrato según los permisos asignados a cada usuario, como administradores y usuarios comunes.

### Temario:

1. Control de Acceso
2. RBAC (Role-Based Access Control)
3. Implementando RBAC en Solidity
4. Ejemplo Práctico

---

## 1. Control de Acceso

### ¿Qué es el Control de Acceso?

El control de acceso es un conjunto de mecanismos que restringen el acceso a determinadas funciones y datos del contrato, garantizando que solo los usuarios autorizados puedan realizar ciertas acciones. Este control es fundamental para proteger los recursos del contrato y asegurarse de que las operaciones críticas sean ejecutadas solo por usuarios con los permisos adecuados.

### Diferentes Enfoques de Control de Acceso

Existen varias formas de implementar control de acceso en contratos Solidity, entre ellas:

- **`onlyOwner`**: Restringe el acceso al propietario del contrato.
- **Listas Blancas**: Una lista de direcciones autorizadas para ejecutar ciertas funciones.
- **RBAC (Role-Based Access Control)**: Define roles específicos con permisos y asigna estos roles a los usuarios, ofreciendo un control de acceso más detallado y flexible.

---

## 2. RBAC (Role-Based Access Control)

### ¿Qué es RBAC?

RBAC (Role-Based Access Control) es una técnica de control de acceso en la que cada usuario tiene un rol asociado que determina sus permisos en el contrato. Este método permite un control más detallado sobre quién puede ejecutar determinadas acciones.

### Características de RBAC

- **Definición de Roles**: Creamos roles que representan niveles de permisos, como administrador, usuario y visitante.
- **Mapeo de Roles a Usuarios**: Asignamos roles específicos a cada dirección.
- **Control Flexible y Detallado**: Podemos definir fácilmente qué acciones puede realizar cada rol, facilitando la gestión del acceso.

---

## 3. Implementando RBAC en Solidity

Veamos cómo implementar RBAC en Solidity.

### Paso 1: Definir Roles con `enum`

Comenzamos definiendo los roles permitidos en el contrato. En este ejemplo, crearemos tres roles: `ADMIN`, `USUARIO` y `INVITADO`.

```solidity
enum Rol {
    ADMIN,
    USUARIO,
    INVITADO
}
```

### Paso 2: Mapear Roles a Usuarios

Creamos un `mapping` que almacena el rol de cada usuario. Usaremos un `mapping` de direcciones a `Rol`, permitiendo que cada dirección tenga un rol asociado.

```solidity
mapping(address => Rol) public roles;
```

### Paso 3: Modificadores para Restringir el Acceso

Usamos `modifiers` para restringir el acceso a las funciones del contrato. Este modificador verificará el rol del usuario antes de permitir la ejecución de la función.

```solidity
modifier soloAdmin() {
    require(roles[msg.sender] == Rol.ADMIN, "Solo los administradores pueden ejecutar esta funcion.");
    _;
}
```

---

## 4. Ejemplo Práctico

Aquí tienes un ejemplo completo de un contrato que implementa RBAC. Este contrato define funciones para gestionar usuarios y restringir el acceso a una función administrativa.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract RBAC {
    enum Rol {
        ADMIN,
        USUARIO
    }

    mapping(address => Rol) public roles;

    constructor() {
        roles[msg.sender] = Rol.ADMIN; // Define al creador del contrato como ADMIN
    }

    modifier soloAdmin() {
        require(roles[msg.sender] == Rol.ADMIN, "Solo los administradores pueden ejecutar esta funcion.");
        _;
    }

    function agregarUsuario(address _usuario) public soloAdmin {
        roles[_usuario] = Rol.USUARIO;
    }

    function funcionRestringida() public soloAdmin {
        // Código que solo el ADMIN puede ejecutar
    }
}
```

### Explicación del Ejemplo

1. **Función `agregarUsuario`**:
   - Permite que el ADMIN agregue nuevos usuarios al sistema, asignándoles el rol de `USUARIO` a la dirección proporcionada.

2. **Función `funcionRestringida`**:
   - Una función a la que solo el ADMIN puede acceder, protegida por el modificador `soloAdmin`.

---

## Conclusión

En esta clase, aprendimos a implementar el Control de Acceso Basado en Roles (RBAC) en contratos Solidity. Esta técnica ofrece una capa de seguridad importante, permitiendo definir quién puede ejecutar cada función en el contrato, según los permisos asignados. Con RBAC, puedes organizar mejor la estructura de permisos de tus contratos, garantizando que las acciones importantes solo sean ejecutadas por usuarios autorizados.

---

## Resumen

1. **Control de Acceso**:
   - Importancia de restringir el acceso a funciones y datos del contrato para proteger los recursos.
2. **RBAC (Role-Based Access Control)**:
   - Definir roles con permisos específicos para garantizar un control de acceso flexible.
3. **Implementación de RBAC en Solidity**:
   - Cómo definir roles con `enum`, mapear estos roles a usuarios y usar `modifiers` para control de acceso.
4. **Ejemplo Práctico**:
   - Creamos un contrato con permisos específicos para `ADMIN` y `USUARIO`, demostrando un control de acceso detallado en Solidity.

---

## Tarea

Crea un contrato llamado `GestorDePermisos` que incluya los roles de `ADMIN`, `EDITOR` y `LECTOR`. Permite que el `ADMIN` asigne o elimine roles a los usuarios y restringe una función de escritura solo al `EDITOR`.

---

## Próximo módulo

En el próximo módulo, hablaremos sobre pruebas y el proceso de despliegue de tu contrato.