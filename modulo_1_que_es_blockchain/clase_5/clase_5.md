# Clase 5: **Criptografía: Claves Públicas y Privadas, y Firmas Digitales**

## Apertura

¡Hola! Bienvenido a la quinta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos los conceptos fundamentales de las cuentas en Ethereum y cómo funcionan en la blockchain. Hoy, profundizaremos en un tema esencial para la seguridad y el funcionamiento de la blockchain: **la criptografía**. Entenderemos cómo funcionan las claves públicas y privadas, y el papel de las firmas digitales en la autenticación y la integridad de las transacciones.

### Programa:

1. Introducción a la Criptografía
2. Claves Públicas y Privadas: La Base de la Seguridad
3. Firmas Digitales: Cómo Funcionan
4. Importancia de la Criptografía en la Blockchain

---

## 1. Introducción a la Criptografía

La **criptografía** es el estudio y la práctica de técnicas para la comunicación segura en presencia de terceros malintencionados. En la blockchain, la criptografía asegura que las transacciones sean seguras, auténticas e íntegras.

### ¿Qué es la Criptografía?

- **Criptografía Simétrica**:
  - Utiliza la **misma clave** para cifrar y descifrar la información.
  - Ejemplo: Dos partes comparten una contraseña secreta para comunicarse.
- **Criptografía Asimétrica**:
  - Utiliza un **par de claves**: una clave pública y una clave privada.
  - La clave pública cifra los datos, y la clave privada los descifra (o viceversa).
  - Es la base de la seguridad en la blockchain y las transacciones digitales.

### Funciones Hash

- **Definición**: Algoritmos que transforman datos de cualquier tamaño en una secuencia fija de caracteres, conocida como hash.
- **Características**:
  - **Determinísticas**: La misma entrada siempre produce la misma salida.
  - **Unidireccionales**: Es impracticable obtener la entrada original a partir del hash.
  - **Sensibles a Alteraciones**: Pequeños cambios en la entrada resultan en hashes completamente diferentes.
- **Uso en la Blockchain**:
  - Asegura la integridad de los datos.
  - Se utiliza en la minería y la creación de direcciones.

### ¿Por qué es Importante la Criptografía en la Blockchain?

- **Integridad**: Asegura que la información no ha sido alterada durante la transmisión.
- **Autenticidad**: Verifica la identidad del remitente, asegurando que el mensaje o la transacción provienen de quien dice ser.
- **No Repudio**: Impide que alguien niegue haber enviado un mensaje o una transacción.

## 2. Claves Públicas y Privadas: La Base de la Seguridad

### ¿Qué Son las Claves Públicas y Privadas?

- **Clave Pública**:
  - Puede ser compartida abiertamente.
  - Se utiliza para verificar las firmas digitales realizadas con la clave privada correspondiente.
  - Sirve como un identificador de la cuenta en la blockchain.
  - Las direcciones de Ethereum se derivan de la clave pública.
- **Clave Privada**:
  - Debe mantenerse en absoluto secreto.
  - Se utiliza para firmar transacciones, demostrando que el remitente tiene autoridad sobre la cuenta.
  - La pérdida o exposición de la clave privada compromete completamente la seguridad de la cuenta.

### ¿Cómo se Generan las Claves?

- **Algoritmos Criptográficos**:
  - **ECC (Criptografía de Curva Elíptica)**: Utilizado en Ethereum para generar pares de claves.
  - Se basa en propiedades matemáticas de las curvas elípticas para crear claves seguras.
- **Proceso de Generación**:
  - Se genera una **clave privada** de forma aleatoria.
  - La **clave pública** se deriva matemáticamente de la clave privada.

### Direcciones en la Blockchain

- **Derivación de la Dirección**:
  - La dirección de Ethereum se deriva de la clave pública, generalmente aplicando una función hash.
  - Ejemplo simplificado:
    - Clave Privada → Clave Pública → Hash de la Clave Pública → Dirección.
- **Identificador Único**:
  - La dirección sirve como identificador público de la cuenta, permitiendo que otros envíen transacciones a ella.

### Importancia de las Funciones Hash

- **Seguridad**:
  - Las funciones hash aseguran que sea impracticable derivar la clave privada a partir de la dirección o la clave pública.
- **Integridad**:
  - Se utilizan para verificar la integridad de los datos y las transacciones.

## 3. Firmas Digitales: Cómo Funcionan

### ¿Qué es una Firma Digital?

- Una **firma digital** es un esquema matemático que demuestra la autenticidad de mensajes o documentos digitales.
- Funciona de manera similar a una firma manuscrita, pero es mucho más segura.
- Garantiza que el mensaje proviene del remitente deseado y no ha sido alterado.

### ¿Cómo se Crean las Firmas Digitales?

1. **Preparación del Mensaje**:
   - Se define el mensaje o la transacción a ser enviada.
2. **Creación del Hash del Mensaje**:
   - Se aplica una función hash al mensaje para obtener una representación fija.
3. **Firma con la Clave Privada**:
   - El remitente utiliza su clave privada para cifrar el hash del mensaje, creando la firma digital.
4. **Envío del Mensaje y la Firma**:
   - El mensaje, junto con la firma digital, se envía al destinatario o a la red.

### ¿Cómo se Verifican las Firmas Digitales?

1. **Recepción del Mensaje y la Firma**:
   - El destinatario recibe el mensaje y la firma digital.
2. **Hash del Mensaje Recibido**:
   - El destinatario aplica la misma función hash al mensaje recibido.
3. **Verificación con la Clave Pública**:
   - Utiliza la clave pública del remitente para descifrar la firma digital, recuperando el hash original.
4. **Comparación de los Hashes**:
   - Si el hash obtenido de la firma coincide con el hash del mensaje recibido, la firma es válida.

### Beneficios de las Firmas Digitales

- **Autenticidad**: Confirma que el mensaje proviene del propietario de la clave privada.
- **Integridad**: Garantiza que el mensaje no ha sido alterado durante la transmisión.
- **No Repudio**: El remitente no puede negar haber enviado el mensaje.

## 4. Importancia de la Criptografía en la Blockchain

### Seguridad de las Transacciones

- La criptografía asegura que solo el propietario de la clave privada pueda mover los fondos de una cuenta.
- Evita fraudes y robos, siempre que las claves privadas se mantengan en secreto.

### Integridad de la Red

- Las funciones hash y las firmas digitales aseguran que los bloques y las transacciones no sean alterados.
- Mantiene la confianza en la red descentralizada, donde no hay una autoridad central.

### Autonomía de los Usuarios

- Los usuarios tienen control total sobre sus cuentas y transacciones.
- No dependen de intermediarios para validar o autorizar operaciones.

### Desafíos y Responsabilidades

- **Protección de las Claves Privadas**:
  - La responsabilidad de la seguridad de las claves privadas es completamente del usuario.
  - Perder la clave privada significa perder el acceso a los fondos de manera permanente.
- **Ataques y Vulnerabilidades**:
  - Técnicas como phishing, malware y otros métodos pueden ser utilizados para robar claves privadas.
  - Es crucial educarse sobre prácticas seguras.

## Conclusión

En esta clase, exploramos los fundamentos de la criptografía y su papel vital en la seguridad de la blockchain Ethereum. Comprendimos cómo las claves públicas y privadas trabajan juntas para garantizar la autenticidad e integridad de las transacciones. Aprendimos sobre las firmas digitales y cómo aseguran que las transacciones sean realizadas por el verdadero propietario de la cuenta. La criptografía es el pilar que sostiene la confianza y seguridad en sistemas descentralizados como Ethereum.

## Recapitulación

1. **Introducción a la Criptografía**: Entendimos la diferencia entre criptografía simétrica y asimétrica, y la importancia de las funciones hash.
2. **Claves Públicas y Privadas**: Exploramos cómo se generan las claves y su papel en la seguridad de las cuentas.
3. **Firmas Digitales**: Aprendimos cómo las firmas digitales garantizan la autenticidad e integridad de las transacciones.
4. **Importancia de la Criptografía en la Blockchain**: Comprendimos cómo la criptografía protege la red y a los usuarios, y la importancia de proteger las claves privadas.

## Tarea

Investiga qué es una función hash criptográfica y encuentra ejemplos de funciones hash populares (como SHA-256 o Keccak-256).

## Próxima clase

En la próxima clase, exploraremos cómo crear tu billetera y enviar una transacción a la blockchain.