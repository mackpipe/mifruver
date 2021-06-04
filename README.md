### MI FRUVER

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
