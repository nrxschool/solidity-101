# Clase 6: **Tu Primer Wallet**

## Apertura

¡Hola! Bienvenido a la sexta clase de nuestro curso de Solidity para principiantes. En las clases anteriores, exploramos los fundamentos de la blockchain, cuentas, criptografía y firmas digitales. Hoy, pondremos en práctica esos conocimientos creando tu primer wallet (billetera) y aprendiendo cómo interactuar con la blockchain de Ethereum. Descubriremos qué es un wallet, cómo crear uno usando MetaMask, conectarnos a diferentes redes y realizar tu primera transacción utilizando faucets. ¡Comencemos!

### Programa:

1. ¿Qué es un Wallet?
2. Conociendo MetaMask
3. Usando Faucets y Realizando tu Primera Transacción
4. Seguridad y Mejores Prácticas

---

## 1. ¿Qué es un Wallet?

Un **wallet** (billetera) es una herramienta esencial que permite interactuar con la blockchain. Funciona como una interfaz para gestionar tus criptomonedas y otros activos digitales, almacenando tus claves privadas y facilitando el envío y la recepción de transacciones.

### ¿Qué es un Wallet?

- **Interfaz con la Blockchain**: Los wallets te permiten interactuar con la blockchain de manera segura y sencilla.
- **Almacenamiento de Claves Privadas**: Guardan tus claves privadas, que son necesarias para acceder a tus activos digitales y firmar transacciones.
- **Gestión de Activos Digitales**: Permiten ver saldos, enviar y recibir criptomonedas y tokens.

### Tipos de Wallets

- **Hardware Wallets**: Dispositivos físicos, como pendrives, que almacenan tus claves privadas de forma offline. Son considerados muy seguros. Ejemplos: Ledger, Trezor.
- **Software Wallets**: Programas instalados en computadoras o dispositivos móviles.
  - **Desktop Wallets**: Instaladas en computadoras.
  - **Mobile Wallets**: Aplicaciones para teléfonos inteligentes.
  - **Extensiones de Navegador**: Como MetaMask.
- **Paper Wallets**: Claves privadas impresas en papel. Son offline, pero pueden perderse o dañarse fácilmente.

### ¿Para qué sirve un Wallet?

- **Almacenar y Gestionar Criptomonedas**: Puedes enviar, recibir y almacenar monedas digitales como Ether (ETH).
- **Interactuar con Aplicaciones Descentralizadas (dApps)**: Acceder a juegos, servicios financieros y otras aplicaciones en la blockchain.
- **Firmar Transacciones y Contratos Inteligentes**: Autorizar operaciones e interacciones con contratos en la red.
- **Acceder y Gestionar tus NFTs**: Ver y negociar tokens no fungibles.

---

# 2. Conociendo MetaMask

**MetaMask** es una de las billeteras más populares para interactuar con la red Ethereum. Es una extensión para navegadores que permite gestionar tus claves privadas y conectarte fácilmente a dApps.

### ¿Qué es MetaMask?

- **Extensión de Navegador**: Disponible para Chrome, Firefox, Brave y Edge.
- **Facilidad de Uso**: Interfaz amigable, ideal para principiantes y desarrolladores.
- **Código Abierto**: El código fuente es abierto, permitiendo auditorías de seguridad.
- **Soporte para Múltiples Redes**: Se conecta a Ethereum Mainnet y diversas testnets.

### Creación de una MetaMask

**Paso a Paso de Instalación y Configuración:**

1. **Instalación:**
   - Accede al sitio oficial: [https://metamask.io/](https://metamask.io/).
   - Haz clic en "Descargar" y elige la extensión compatible con tu navegador.
   - Instala la extensión siguiendo las instrucciones proporcionadas.

2. **Configurando tu Billetera:**
   - Después de la instalación, haz clic en el ícono de MetaMask en tu navegador.
   - Haz clic en "Comenzar" y selecciona "Crear una billetera".
   - **Crea una contraseña fuerte** para proteger tu billetera localmente.

3. **Seed Phrase (Frase de Recuperación):**
   - MetaMask generará una **frase secreta de recuperación** de 12 palabras.
   - **Anota esta frase en un lugar seguro y fuera de línea**. Es esencial para recuperar tu billetera si olvidas la contraseña o pierdes acceso al dispositivo.
   - Confirma la frase de recuperación en el orden correcto para continuar.

4. **Billetera Creada:**
   - Tu MetaMask está lista para su uso.
   - Verás tu dirección pública (comienza con "0x"), saldo y podrás gestionar tus activos.

### Conexión con Redes

- **Mainnet (Red Principal):**
  - Red oficial donde las transacciones tienen valor real.
  - Usa con precaución, ya que las transacciones son irreversibles e involucran dinero real.

- **Testnets (Redes de Prueba):**
  - Redes simuladas para desarrollo y pruebas.
  - Las criptomonedas no tienen valor real.
  - Ejemplos: Ropsten, Rinkeby, Goerli, Kovan.

**Añadiendo Redes en MetaMask:**

1. **Seleccionar la Red:**
   - Haz clic en el menú desplegable en la parte superior de MetaMask (generalmente está escrito "Ethereum Mainnet").
   - Selecciona una de las testnets disponibles o haz clic en "Añadir Red".

2. **Añadir Redes Personalizadas:**
   - Para añadir redes como Polygon, haz clic en "Añadir Red" e ingresa los detalles:
     - **Nombre de la Red**: Ejemplo, "Polygon Mumbai Testnet".
     - **URL del RPC**: Dirección para conectarse a la red.
     - **ID de la Cadena (Chain ID)**: Identificador único de la red.
     - **Símbolo de la Moneda**: Ejemplo, "MATIC".
     - **URL del Explorador de Bloques**: Opcional, para visualizar transacciones.

3. **Guardar y Conectar:**
   - Después de ingresar los datos, haz clic en "Guardar".
   - Tu MetaMask estará conectada a la nueva red.

## 3. Utilizando Faucets y Realizando tu Primera Transacción

### ¿Qué son los Faucets?

- **Definición:**
  - Los faucets son servicios en línea que proporcionan pequeñas cantidades de criptomonedas de prueba de manera gratuita.
  - Están destinados a que desarrolladores y usuarios puedan probar transacciones sin gastar dinero real.

- **Utilidad:**
  - Practicar el envío y recepción de criptomonedas.
  - Probar contratos inteligentes e interacciones con dApps.

### ¿Cómo Usar un Faucet?

1. **Obtener la Dirección de tu Billetera:**
   - Abre MetaMask y copia tu dirección pública.

2. **Encontrar un Faucet Adecuado:**
   - Para la Ethereum Goerli Testnet: [Goerli Faucet](https://goerlifaucet.com/).
   - Para la Polygon Mumbai Testnet: [Faucet Polygon](https://faucet.polygon.technology/).

3. **Solicitar Criptomonedas de Prueba:**
   - Accede al faucet y pega tu dirección en el campo solicitado.
   - Sigue las instrucciones, que pueden incluir verificaciones de seguridad como captchas.
   - Envía la solicitud y espera la confirmación.

4. **Verificar el Saldo:**
   - Después de unos minutos, verifica si el saldo ha aparecido en tu MetaMask.

### Realizando tu Primera Transacción

1. **Enviar Criptomonedas de Prueba:**
   - En MetaMask, haz clic en "Enviar".
   - Ingresa la dirección de destino (puede ser otra cuenta tuya o de un compañero).
   - Escribe la cantidad que deseas enviar.
   - Ajusta las tarifas de gas si es necesario (generalmente, el valor por defecto es adecuado en testnets).
   - Haz clic en "Siguiente" y luego en "Confirmar" para enviar.

2. **Analizar la Transacción en el Explorador de Bloques:**
   - Después de la confirmación, MetaMask proporcionará un enlace para visualizar la transacción en el explorador de bloques.
   - Haz clic en el enlace o accede al explorador manualmente e ingresa el hash de la transacción.
   - Verifica detalles como el estado, el valor enviado, las direcciones involucradas y las tarifas.

3. **Confirmar la Recepción:**
   - Si enviaste a otra de tus cuentas, cambia de cuenta en MetaMask para verificar la recepción.
   - Si lo enviaste a un compañero, pídele que confirme la recepción.

## 4. Seguridad y Mejores Prácticas

Mantener tu billetera segura es esencial para proteger tus activos digitales. Nunca dejes expuestas tus claves privadas.

### Buenas Prácticas

- **Verifica URLs y Extensiones:**
  - Asegúrate de estar en el sitio oficial antes de descargar o ingresar información.
- **Desconfía de Ofertas Irresistibles:**
  - Los estafadores pueden ofrecer criptomonedas gratuitas a cambio de información.
- **Educación Continua:**
  - Mantente actualizado sobre técnicas de phishing y otras amenazas.

## Conclusión

En esta clase, aprendiste qué es una billetera y su importancia en el ecosistema blockchain. Creamos juntos una MetaMask, nos conectamos a diferentes redes y realizamos tu primera transacción usando faucets. También destacamos la importancia de la seguridad y las mejores prácticas para proteger tus activos digitales. Con estos conocimientos, estás listo para explorar el mundo de las criptomonedas e interactuar con contratos inteligentes de forma segura.

## Recapitulación

1. **¿Qué es una Billetera?**
   - Herramienta que permite almacenar claves privadas e interactuar con la blockchain.
2. **Conociendo MetaMask:**
   - Extensión de navegador que facilita la gestión de activos y la conexión con dApps.
3. **Usando Faucets y Realizando tu Primera Transacción:**
   - Obtviste criptomonedas de prueba y practicaste transacciones en redes de prueba.
4. **Seguridad y Mejores Prácticas:**
   - Aprendiste a proteger tu seed phrase, usar contraseñas fuertes y evitar estafas.

## Tarea

Instala MetaMask y crea tu propia billetera. Usa un faucet para obtener criptomonedas de prueba y realiza una transacción.

## Próxima clase

En la próxima clase, configuraremos nuestro entorno de desarrollo para comenzar a programar en Solidity. Aprenderás a instalar las herramientas necesarias y darás los primeros pasos en la creación de contratos inteligentes. ¡Hasta entonces!