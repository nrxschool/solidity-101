# Clase 5: **Pruebas Unitarias con Hardhat**

## Introducción

¡Bienvenido a la Clase 5! Hoy aprenderemos cómo escribir **pruebas unitarias** para contratos en Solidity usando **Hardhat**. Las pruebas unitarias son esenciales para garantizar que el contrato funcione como se espera, evitando errores y vulnerabilidades antes del despliegue.

### Temario:

1. Pruebas Unitarias  
2. Escribiendo Pruebas con Hardhat  

---

## 1. Pruebas Unitarias

### ¿Qué son las Pruebas Unitarias?

- **Definición**: Pruebas que verifican el comportamiento de pequeñas unidades de código, generalmente funciones.  
- **Importancia**:  
  - **Confiabilidad**: Garantizan que el contrato funcione correctamente.  
  - **Detección Temprana de Errores**: Identifican fallas antes del despliegue.  
  - **Facilidad de Mantenimiento**: Facilitan las refactorizaciones, ya que los errores serán detectados rápidamente.  
  - **Documentación**: Sirven como documentación sobre el funcionamiento del contrato.  

---

## 2. Escribiendo Pruebas con Hardhat

### ¿Cómo Escribir Pruebas en Hardhat?

- **Framework de Pruebas**: Hardhat utiliza **Mocha** para estructurar las pruebas y **Chai** para las aserciones.  
- **Estructura de Carpetas**: Los archivos de prueba se encuentran en la carpeta `test/`.  
- **Organización de las Pruebas**:  
  - **describe**: Bloque que agrupa pruebas relacionadas con un contrato o función específica.  
  - **it**: Define pruebas individuales para una función o comportamiento específico.  
  - **expect**: Se utiliza para realizar aserciones sobre el resultado de las funciones, asegurando que devuelvan el valor esperado.  

---

## Conclusión

En esta clase, aprendimos la importancia de las **pruebas unitarias** en el desarrollo de contratos inteligentes. Vimos cómo Hardhat facilita la creación y organización de pruebas, permitiendo un enfoque estructurado y seguro para el desarrollo de contratos. Con estas prácticas, puedes construir contratos inteligentes más sólidos y confiables.

---

## Resumen

1. **Pruebas Unitarias**: Aseguran que cada función del contrato funcione correctamente.  
2. **Escribiendo Pruebas con Hardhat**: Estructura de pruebas utilizando Mocha y Chai con Hardhat.  

---

## Tarea

Crea un contrato simple que tenga una función que devuelva un valor constante. Escribe pruebas unitarias para verificar si el valor devuelto es el esperado y experimenta aplicando el ciclo de TDD para la implementación.

---

## Próximo Módulo

En el próximo módulo, realizaremos proyectos prácticos.
