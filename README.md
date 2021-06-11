## MI FRUVER

## Descripción del proyecto

El Proyecto estara enfocado en la creación de un sistema para administración y venta para un establecimiento de frutas y verduras llamado Mi Fruver.

### Características del proyecto

- Cuenta para cada Cliente
- Pago a Proveedores
- Registro de Artículos con código
- Lleve un control detallado de su inventario, ventas, clientes, cortes de caja y mucho mas...
- Software compatible con una amplia gama de complementos como lectores de códigos de barras, min-iprinter, cajones de dinero y computadoras.
- Bases de Datos
- Emisión de Tiket
- Registro de Ventas
- Movimientos de caja
- Informes de Cierres de caja
- Altas de Clientes
- Inventarios
- Productos
- Productos por almacén
- Categorías de productos
- Atributos de productos
- Control de insumos
- Categorías de impuestos
- Informes de Máximos y Mínimos
- Ventas por Producto
- Ventas por Vendedor
- Usuarios con diferentes permisos
- Respaldo y restauración de la base de datos

## Prerrequisitos
### Software y Cuentas

1. Antes de iniciar con el proyecto debes tener instalado en el PC, los siguientes Software:
- Xampp:
    + https://www.apachefriends.org/es/download.html
      - ![image](https://user-images.githubusercontent.com/84990344/121243714-a924a280-c863-11eb-9ae2-ae502995a356.png)

- Composer
    + https://getcomposer.org/download/
      - ![image](https://user-images.githubusercontent.com/84990344/121243843-ceb1ac00-c863-11eb-8733-a714e8a68374.png)

- Git Bash
    + https://git-scm.com/download/win
      - ![image](https://user-images.githubusercontent.com/84990344/121243970-f4d74c00-c863-11eb-96f9-50965c3703fb.png)

- Visual Studio Code
    + https://code.visualstudio.com/download
      - ![image](https://user-images.githubusercontent.com/84990344/121244078-16383800-c864-11eb-8d69-eb327130d3e6.png)


2. Debes que crear una cuanta con ayuda del correo electronico en:

- Azure DevOps
    + https://azure.microsoft.com/es-es/services/devops/
      - ![image](https://user-images.githubusercontent.com/84990344/121244264-44b61300-c864-11eb-8c1b-f0a3365dd069.png)
- GitHup
    + https://github.com/
      - ![image](https://user-images.githubusercontent.com/84990344/121244334-5bf50080-c864-11eb-9839-5d60e8cc5551.png)

3. Despues de clonar el Reposotorio debes instalar Drupal 8, en la seccion de de Instalacion veras el comando necesario para la instalacion de drupal, despues de tenerlo instalado debes crear el entorno local de tu proyecto (mifruver)

      - ![image](https://user-images.githubusercontent.com/84990344/121244522-93fc4380-c864-11eb-905f-a440807b4c13.png)

4. Debes tener encuanta que las versiones del Xampp y Composer debes ser las mismas.

## Proceso de instalación del Proyecto

- Copiar la url del repositorio desde GITHUB, se da clic en la opción **Code** y se copia la url del repositorio
[https://github.com/mackpipe/mifruver.git](url)

![image](https://user-images.githubusercontent.com/36545398/121240048-8db79880-c85f-11eb-940c-00f46481bb54.png)

- Crear directorio en el servidor local **xampp** en la ruta [C:\xampp\htdocs\]

- Ejecutar git desde el directorio creado, se da click derecho y selecciona la opción **Git Bash Here**

![image](https://user-images.githubusercontent.com/36545398/121240199-b049b180-c85f-11eb-89ee-a46af65b4e95.png)

- Clonar el repositorio, desde la consola del **Git Bash Here** ejecutar el comando `git clone https://github.com/mackpipe/mifruver.git`

- Cambiarse al directorio mifruver (El directorio del proyecto clonado)

- Se recomienda para efectos de pruebas y que el proceso automatico no tenga problemas, se cree un usuario en mysql con todos los privilegios para no usar el usuario root).

  - Abrir CMD (consola de windows)  y ejecutar  `c:/xampp/mysql/bin`

  - Luego de estar ubicado en **c:/xampp/mysql/bin** se debe ecutar el siguiente comando `mysql -uroot -p`

  - El sistema pedira la clave del usuario roor, indicarla y deberia quedar en el Inicio de sesion de mysql, como se muestra en la imagen
  ![image](https://user-images.githubusercontent.com/1072188/121724037-e760d280-caac-11eb-8d44-5765241c1e34.png)

  - Estando en la consola de Mysql ejecutar el siguiente comando: `CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';`

  - El comando anterior crea un usuario en mysql, ahora solo faltaria darle los permisos con el siguiente comando `GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';`

  - Ya estaria listo la creación del usuario, ahora solo teclee exit y cerrar ventana. 

- Abrir el archivo **.env** y asignar los valores a las variables segun se tenga su ambiente local (Aqui estamos usando ya el usuario que acabamos de crear)

- Ejecutar el comando `./init.sh` (Este comando hace los siguientes procesos)
  - Crea la rama develop
  - Descarga los ultimos cambios de develop
  - Borra la base de datos configurada en .env
  - Crea la base de datos configurada en .env
  - Importa el backup inicial de la base de datos para Drupal

- Entrar al sitio desde el navegador.

## Generación de Ramas

La generación de las ramas se debe realizar para el caso de los desarrolladores a partir de la rama Develop. Esta rama debe ser la principal y todos los desarrolladores deben estar sincronizados con esta rama y sus ultimas modificaciones para evitar conflictos.

Las ramas permiten trabajar en los entornos locales de los desarrolladores, permite ubicar de forma organizada la respuesta directa a las Historias de usuario (HU), por tal motivo las ramas se encuentran estandarizadas para este proyecto de la siguiente manera:

     > EP01-FE01-HU001-08
        EP01 = Epica y el número
        FE01 = Feature y el número
        HU01 = Historia de Usuario y el número
        08 = Es el ID de Azure

Para crear la rama se utiliza el siguiente comando:

    `git checkout -b nombre_rama`

Si deseo cambiar de rama o volver a la rama Develop utilizo el siguiente comando:

    `git checkout develop`

La jerarquia de las ramas es la siguiente:

![image](https://user-images.githubusercontent.com/75544836/121255932-a0d36400-c871-11eb-8b2d-2b4985e686b4.png)

Para borrar una rama se utiliza el siguiente comando:

    `git branch -d nombre_rama`

Si la rama tiene algun dato sin fusionar se puede forzar el borrado con el siguiente comando:

    `git branch -D nombre_rama`

Para subir la información al repositorio una vez se hallan adicionado al staying y se halla confirmado el commit, la rama finalmente se sube al repositorio con el comando:

    `git push origin nombre_rama`

Es importante que antes de confirmar la subida de la rama, se confirme que la rama develop se encuentre con los ultimos cambios para ello confirmo con el comando:

    `git pull origin develop`

Si la rama ya se ha subido antes y se desea actualizar confirmo con el comando:

    `git pull origin nombre_rama`

## Parámetros para creación de un commit

Se debe manejar el siguiente estándar:
     > git commit -m ":emoji: AB#08 **Breve explicación de la tarea realizada**"

### Generación de Commit

1. **Que es un commit**:  Es un comando que se utiliza para documentar algún cambio que se vaya a realizar al proyecto.

2. **Cuando se hace un commit**:  Se hace para indicar que esta lista alguna funcionalidad y que será una nueva versión del código.  Esto se hace para que el equipo colaborativo (desarrolladores) pueda entender y/o solucionar algún error.

3. **Partes de un commit**:

     `git commit -m ":emoji: AB#1 EP01-FE01-HU001 - Titulo de Historia de Usuario / Bug"`

     - **`commit`** :  comando para confirmar cambios
     - **`-m`** : indica que se incluye una descripción al **commit**
     - **`:emoji:`**:  imagen que esta asociado a la **historia de usuario**
     - **`AB#1`** : Indica que se relaciona el **commit** con la Historia de usuario en Azure devops
     - **`EP01`** : Indica que la historia de usuario/bug pertenece a la **Epica 01**
     - **`FE01`**:  Indica que pertenece a la **Feature (Característica) 01**  donde esta clasificada la historia de usuario
     - **`HU01`** : Indica la historia de usuario a la cual se esta asociando el **commit**
     - **`BUG01`**: Indica el **bug** al cual se esta asociando el **commit**

   **Ejemplo de un commit**

      `git commit -m ":bug: AB#1 EP01-FE01-HU001 - Titulo de Historia de Usuario / Bug"`

      Visualizaciòn en github:

      ![image](https://user-images.githubusercontent.com/84405166/121075345-b0cc4480-c79a-11eb-8943-b390325be1ce.png)

4. **Listado de emojis de commit**
    - En el siguiente link se encuentra el listado de emojis:  [https://gitmoji.dev](url)
    - Emojis mas usados
         -  :bug: **bug** Fix a bug / Corregir un error.
         -  :construction: **construction** Work in progress / Trabajo en progreso.
         -  :pushpin:  **pushpin** Pin dependencies to specific versions / Anclar dependencias a versiones especificas.
         -  :wrench:   **wrench** Add or update configuration files / Agregue o actualice archivos de configuración.
         -  :boom: **boom** Introduce breaking changes / Introduce cambios importantes.


## Flujo de proceso de GIT

En esta sesion veremos los comandos que se deben usar en cada modificacion del repositorio

### Al inicio de un proyecto:

- Clonar el repositorio
 * `git clone`
   - ![image](https://user-images.githubusercontent.com/84990344/121257544-6e2a6b00-c873-11eb-80c6-3269b7e92b31.png)

### Verificacion de ramas:

 * `git branch` :Identifica en la rama en la que estas ubicado
 * `git branch -r` :Identifica todas las ramas del repositorio

 ### Comandos que se usan diariamente

  1. `git checkout develop` :Rama inicial

  2. `git pull origin develop` :Extraer o cargar ultimos cambios del repositorio

  3. `git checkout -b EP01-FE03-HU016-37` :Creacion de una Rama para la solucion de la HU
 4. `git status` :Verificacion de estado del repositorio

 - Adicionar staged de los archivos/o carpetas de Git <composer.json y composer.lock>

  5. `git add .` :subir todos los archivos
     `git add nombre_archivo` :Subir solo 1 archivo

  6. `git commit -m ":emoji:AB-37 Breve explicacion de la Solicion de HU" ` :Comentario de la solucion de HU

  7. `git push origin <nombre de rama HU>` :Cargar o subir contenido al repositorio

  - Despues de subir el contenido al repo, se procede a realizar el pull request de la rama HU a la rama Develop.

 ### Ejemplo de pasos diarios

   - `git branch`
 - ![image](https://user-images.githubusercontent.com/84990344/121252238-62d44100-c86d-11eb-8343-8d906a2a9517.png)

   - `git branch -r`
 - ![image](https://user-images.githubusercontent.com/84990344/121252374-88f9e100-c86d-11eb-91d7-b2e527132aab.png)

   - `git checkout develop`
 - ![image](https://user-images.githubusercontent.com/84990344/121252491-adee5400-c86d-11eb-9c89-740314516e59.png)


   - `git pull origin develop`
 - ![image](https://user-images.githubusercontent.com/84990344/121252605-d24a3080-c86d-11eb-85aa-d01c652dbf2a.png)

   - `git checkout EP01-FE03-HU016-37`
 - ![image](https://user-images.githubusercontent.com/84990344/121252734-f86fd080-c86d-11eb-8236-dba6eb18698b.png)

   - `git status`
 - ![image](https://user-images.githubusercontent.com/84990344/121253061-4b498800-c86e-11eb-8e6c-f26c81e0b69f.png)

   - `git add img`
 - ![image](https://user-images.githubusercontent.com/84990344/121254168-931cdf00-c86f-11eb-9c50-5ad538268454.png)

   - `git commit -m ":memo: AB#42 Se actualiza nueva seccion Prerrequisitos en el archivo README.md"`
 - ![image](https://user-images.githubusercontent.com/84990344/121261953-05de8800-c879-11eb-8b95-c5d3c6e508de.png)

   - `git push origin EP01-FE03-HU018-42`
 - ![image](https://user-images.githubusercontent.com/84990344/121255314-e2174400-c870-11eb-8470-93624c918cd5.png)


##  Configuración de Virtualhost

1.  **Que es Virtualhost**:  Consiste en  darle un nombre de dominio a la IP virtual.

2.  **Pasos a realizar**:  se deben editar los siguientes archivos con el fin de incluirles las siguientes lineas:

       - **hosts**:  Debe quedar en una línea de código **`127.0.0.1 mifruver.com`**

           ![image](https://user-images.githubusercontent.com/84405166/120959028-7b821100-c71e-11eb-999c-3cd07dc5c897.png)

       - **httpd-vhosts.conf**:  Se debe registrar en el archivo las siguientes líneas de código en el archivo que se encuentra en la siguiente ruta:

          ![image](https://user-images.githubusercontent.com/84405166/120959158-c8fe7e00-c71e-11eb-878e-aa566b4e16be.png)

     **Còdigo**

         - NameVirtualHost *
         -   <VirtualHost *>
         -        DocumentRoot "C:\xampp\htdocs"
         -        ServerName localhost
         -   </VirtualHost>
         -   <VirtualHost>
         -  	   DocumentRoot "C:\xampp\htdocs\proyectos\drupal\mifruver"
         -         ServerName mifruver.com
         -             <Directory "C:\xampp\htdocs\proyectos\drupal\mifruver">
         -  	             Require all granted
         -  	        </Directory>
         -   </VirtualHost>

##  Creación Pull Requests

1. **Que es un Pull Requests**:  Es una petición que se realiza para integrar los  cambios de código a un proyecto.

2. **Como se crea un Pull Requests**:  A continuación se relacionan los pasos:

    - Desde GITHUB se ubica en la opción del Menú **Pull requests** y da clic en el botón verde **New Pull Requests**

       ![image](https://user-images.githubusercontent.com/84405166/120964141-6ad69880-c728-11eb-821a-b983852892f1.png)

    - Selecciona las Ramas en la cual realizo el cambio (Ejemplo:  prueba) y a la que se debe pasar (Ejemplo: develop)

       ![image](https://user-images.githubusercontent.com/84405166/120964273-af623400-c728-11eb-97aa-b49288aca063.png)

    - Una vez seleccionadas las ramas, se debe documentar utilizando un estándar en el Pull requests como se muestra en la imagen.   y por ultimo dar click en el botón verde **Create Pull Requests**

       ![image](https://user-images.githubusercontent.com/84405166/120966771-4f6d8c80-c72c-11eb-9f9b-e99e7c2fd9ab.png)

    -  Se relaciona a continuación una imagen donde se ve las opciones del **Write** y **Preview**; el primero permite registrar la información (con unos comodines ## funciona para destacar un titulo) y la otra opción es la vista previa ( se ve el texto con formato de titulo)

        ![image](https://user-images.githubusercontent.com/84405166/121092302-f136bd00-c7b0-11eb-83f4-afa90cdde6e4.png)

3.  En la creación del Pull Request se debe seleccionar el **Reviewer**, es la persona que va a revisar el Pull Requests y confirmara si Aprueba o Devuelve para nueva revisiòn.

![image](https://user-images.githubusercontent.com/84405166/121094177-d6197c80-c7b3-11eb-9bf2-4cfac414ff80.png)

## Solución de un conflicto en GitHub

Un conflicto se genera cuando se cambia el mismo archivo de manera contradictoria, mas especificamente cuando se editan exactamente las mismas lineas en el mismo archivo. En ese caso, Git no tiene forma de saber que es correcto; se debe mirar los cambios y decidir como se quiere que se vea finalmente el archivo.

### ¿Como conocer si tengo un conflicto?

En la terminal de Git cuando envio el comando "git status" se muestra un problema en las ramas y un problema para fusionarlas un "unmerged" tal y como se puede ver a continuación:

![image](https://user-images.githubusercontent.com/75544836/121393306-d6ca2400-c915-11eb-8b43-180cf8bf2c5a.png)

### ¿Que veo cuando abro el archivo?

En el archivo, Git simplemente marca las áreas que se editaron de manera contradictoria, asi:

Archivo Local

![image](https://user-images.githubusercontent.com/75544836/121394000-87382800-c916-11eb-8a38-e3c25797174e.png)

Archivo Entrante

![image](https://user-images.githubusercontent.com/75544836/121394326-d67e5880-c916-11eb-8470-3d05216aa6de.png)

### ¿Que significan las opciones que ofrece git?

En esta parte encontramos varias opciones:

![image](https://user-images.githubusercontent.com/75544836/121394634-29f0a680-c917-11eb-8520-0a4f2f08c5d8.png)

* La primera opción "Accept Current Change" es Aceptar el cambio actual es decir deja el Archivo Local

* La segunda opción "Accept Incomming Change" es Aceptar cambio entrante es decir deja el Archivo Entrante

* La tercera opción "Accept Both Change" es Aceptar ambos cambios es decir deja los dos archivos

* La cuarta opción "Compare Change" es Comparar los cambios es decir que muestra linea a linea que cambio

### Resolución del conflicto:

1. Inicialmente puedo usar la cuarta opción para que muestre los cambios linea a linea entre los dos archivos, una vez ubicadas las diferencias agrego mis cambios en un block de notas o algun documento externo.

2. Acepto la segunda opción de los cambios entrantes, edito de nuevo el archivo adicionando los cambios que guarde externamente.

3. Adiciono a la rama en la que estoy trabajando el archivo que estaba modificando y que habia generado el conflicto con `git add nombre_archivo`

4. Confirmo el archivo con el commit `git commit -m ":emogi: AB#1 descripcion del evento"`

5. Subo el cambio al repositorio de GitHub `git push origin nombre_rama`

6. Genero Pull Request a la rama Develop en GitHub
