# mifruver
Proyecto web dedicado a las frutas

# Proceso de instalación del Proyecto

1. Ya instalado xampp o el servidor local, nos dirigimos para el caso de xampp a la ruta "C:\xampp\htdocs\" donde crearemos un directorio (carpeta) para crear nuestro proyecto y deberia quedar una ruta por ejemplo "C:\xampp\htdocs\proyecto\".
2. Siguiente se debe tener creada y activa una cuenta en github, la cual va a ser adicionada al grupo de trabajo del repositorio
3. Ya dentro de github, ingresando al repositorio se encuentra una opcion en color verde que dice "Code", en la cual al dar click nos da la opción de clonación del proyecto, la cual debemos copiar "https://github.com/mackpipe/mifruver.git".
4. Debemos regresar a nuestro xampp y posicionarnos en la ruta "C:\xampp\htdocs\proyecto\" donde creamos nuestro directorio para instalar el proyecto, y al dar click derecho en la ruta nos deplegara una ventana de la cual seleccionaremos la opcion "Git Bash Here", el cual nos abrira una nueva ventana con el aplicativo para ejecutar comandos.
5. Dentro de la ventana que nos abrio en el punto anterior debemos ejecutar el comando "git clone (+ el comando que copiamos en el #3)", como por ejmplo para este caso quedaria "git clone https://github.com/mackpipe/mifruver.git"; Este comando inmediatamente descargara todo el proyecto del repositorio en nuestro ambiente local.
6. Seguido debemos ejecutar el comando "git checkout -m develop" para crear la rama donde instalaremos nuestro proyecto.
7. Seguido debemos ejecutar el comando "git checkout -m mi_rama" para crear la rama donde instalaremos nuestro proyecto, en este caso "mi_rama sera nuestra historia de usuario, nombre que puede ser el que queramos"
8. Para saber que estamos dentro de la rama creada ejecutamos el comando "git brach", donde nos aparece marcado con un (*) la rama en la cual estamos ubicados.
9. Seguido ejecutamos el comando "git pull origin develop" que lo que hara sera descargar de la rama develop del repositorio todos los cambios realizados
10. Ya teniendo los ultimos cambios descargados se debe ejecutar el comando "composer install", que lo que hara sera traernos los archivos de instalacion y configuración del Drupal a nuestro directorio.
11. Seguidamente ingresamos en nuestro navegador a la ruta donde se instalo el proyecto, en este caso "http://localhost/proyectos/mifruver/web/" y seguimos los pasos de instalación estandar, donde nos pedira el nombre de la base de datos y el usuario.
12. Para crear la base de datos debemos ingresar a el administrador de base de datos que nos suministra xampp, en este caso ingresamos a "http://localhost/phpmyadmin/", y en la opción "Nueva" vamos a crear la base de datos.
13. Volviendo al #11 cuando en la instalación nos solicite el nombre de la base de datos, indicamos el nombre creado y en usuario colocamos "root", ya seguimos al siguiente paso en la instalación que es indicar el nombre del sitio y seleccionar la zona horaria y ubicación.
14. De esta forma al finalizar la carga de modulos y traducciones que se realiza automaticamente en la instalación, vamos a encontrar nuestro sitio Drupal ya instalado.