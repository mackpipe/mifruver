### MI FRUVER

## Prerrequisitos
### Software y Cuentas

1. Antes de iniciar con el proyecto debes tener instalado en el PC, los siguientes Software:
- Xampp:
    + https://www.apachefriends.org/es/download.html
    - ![Install Xampp](https://user-images.githubusercontent.com/84990344/121222380-1fb5a600-c84c-11eb-87e1-adb3e39f504f.png)
- Composer
    + https://getcomposer.org/download/
    - ![Install Composer](https://user-images.githubusercontent.com/84990344/121222357-19272e80-c84c-11eb-8bd4-3713caa8ef90.png)
- Git Bash
    + https://git-scm.com/download/win
    - ![Install Git Bash](https://user-images.githubusercontent.com/84990344/121222469-2cd29500-c84c-11eb-9145-7aceaeb8b8d8.png)
- Visual Studio Code
    + https://code.visualstudio.com/download
    - ![InstallVisualStudioCode](https://user-images.githubusercontent.com/84990344/121222433-280de100-c84c-11eb-95b0-4c13573465ad.png)


2. Debes que crear una cuanta con ayuda del correo electronico en:

- Azure DevOps
    + https://azure.microsoft.com/es-es/services/devops/ 
    - ![CrearUserAzure](https://user-images.githubusercontent.com/84990344/121222705-65726e80-c84c-11eb-9d68-e158a9c06e9a.png)
- GitHup
    + https://github.com/ 
    - ![CrearUserGit](https://user-images.githubusercontent.com/84990344/121222755-6f946d00-c84c-11eb-9e03-5d251b93a260.png)

3. Despues de clonar el Reposotorio debes instalar Drupal 8, en la seccion de de Instalacion veras el comando necesario para la instalacion de drupal, despues de tenerlo instalado debes crear el entorno local de tu proyecto (mifruver)
    - ![Drupalmifruver](https://user-images.githubusercontent.com/84990344/121222799-7622e480-c84c-11eb-8315-29eeb59b2ab4.png)

4. Debes tener encuanta que las versiones del Xampp y Composer debes ser las mismas.
### Instalación

1. Crear el repositorio de Github para almacenar el proyecto
2. Instalar Drupal con Composer, utilizando el siguiente comando: `composer install`
3. Configurar el Virtual Hosts de Apache, (http://mifruver.com) , utilizando los siguientes archivos:
    -  hosts
    - httpd-vhosts.conf
4. Instalar el modulo [admin_toolbar] utilizando el siguiente comando: `composer require drupal/admin_toolbar`
5. Instalar el modulo [drush] utilizando el siguiente comando: `composer require drush/drush`
    - Ejecutar el comando de borrado de cache `vendor/drush/drush/drush cr` para validar el resultado
6. Instalar el modulo [console] utilizando el siguiente comando: `composer require drupal/console --witch-dependencies` 
    - Ejecutar el comando de borrado de cache `vendor/drupal/console/bin/drupal cr` para validar el resultado
7. Configurar el proceso de sincronización
8. Instalar el modulo contribuido [console] utilizando el siguiente comando: `composer require drupal/backup_migrate:5.0.0-rc2` 
9. Instalar el modulo [token] utilizando el siguiente comando:

### Configuración - Flujo de Comandos

1.  Al solucionar la(s) task de una HU se debe:
     - Nivelar el proyecto localmente utilizando el `git pull origin develop` 
2.  Crear rama donde se trabaja la HU.  El número que va en la HU hace referencia a la historia de usuario.
     - Utilizar el siguiente comando:  `git checkout - b EP01-FE01-HU001-08 `
     - Dentro de la rama se realiza la solución de la HU
4. Se adicionar al staged de git con `git add **nombre_archivo**` :  archivos y/o carpetas que se han modificado
5. Se hace commit con la siguiente estructura `git commit -m ":emoji: AB-08 **Breve explicación de la tarea realizada**"
6. Se vuelve a hacer el `git pull origin develop` desde la rama de la HU para comprobar que este aún nivelado
7. Se ejecuta el `git push origin develop` para subir el archivo
8. Se procede a crear el pull request de la rama de la HU a la rama develop en Github

### Parámetros para creación de una Rama

Se debe manejar el siguiente estándar:
     > EP01-FE01-HU001-08
        EP01 = Epica y el número
        FE01 = Feature y el número
        HU01 = Historia de Usuario y el número
        08 = Es el ID de Azure

### Parámetros para creación de un commit

Se debe manejar el siguiente estándar:
     > git commit -m ":emoji: AB#08 **Breve explicación de la tarea realizada**" 

## Generación de Commit

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
