#!/bin/bash
#set -e
# Exporta las variables de ambiente para tenerlas disponibles en el bash
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Define la carpeta donde se almacenara el backup de la base de datos a ejecutar
FOLDER_SQL=$MYSQL_PATH/sql
FOLDER_LIBRARIES="libraries"

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 1. Generando rama develop "
echo >&2
echo >&2 "========================================================================"

git checkout -b develop

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 2. Descargando actualizacion de la rama develop "
echo >&2
echo >&2 "========================================================================"

git pull origin develop

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 3. Ejecutando composer install "
echo >&2
echo >&2 "========================================================================"

composer install

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 4. Copiando settings.php y settings.local.php a web/sites/default"
echo >&2
echo >&2 "========================================================================"

cp backup/settings.php ./web/sites/default
cp backup/settings.local.php ./web/sites/default

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 4. Copiando librerias de modulos Contrib"
echo >&2
echo >&2 "========================================================================"

# Create the custom modules folder
if ! [ -d "$FOLDER_LIBRARIES" ]
then  
  mkdir $FOLDER_LIBRARIES
fi

cp -R backup/libraries/* ./web/libraries

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 5. Copiando el backup de la base de datos a $FOLDER_SQL "
echo >&2
echo >&2 "========================================================================"

# Create the custom modules folder
if ! [ -d "$FOLDER_SQL" ]
then  
  mkdir $FOLDER_SQL
fi

cp backup/backup_initial.mysql $MYSQL_PATH/sql

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 6. Se cambia de directorio de trabajo a $MYSQL_PATH "
echo >&2
echo >&2 "========================================================================"
cd $MYSQL_PATH

echo >&2 "========================================================================"
echo >&2
echo >&2 " 7. Borra la base de datos $MYSQL_DATABASE"
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "DROP database $MYSQL_DATABASE;"

echo >&2 "========================================================================"
echo >&2
echo >&2 " 8. Crea la base de datos $MYSQL_DATABASE"
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE database $MYSQL_DATABASE"

echo >&2 "========================================================================"
echo >&2
echo >&2 " 9. Importa el backup en la base de datos $MYSQL_DATABASE"
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --default-character-set=utf8 $MYSQL_DATABASE < sql/backup_initial.mysql

echo >&2 "========================================================================"
echo >&2
echo >&2 " !! Backup importado correctamente!!"
echo >&2
echo >&2 "========================================================================"

sleep 5

echo >&2 "========================================================================"
echo >&2
echo >&2 " 10. Se borra el cache de Drupal"
echo >&2
echo >&2 "========================================================================"

sleep 5

echo >&2 "========================================================================"
echo >&2
echo >&2 " !Upps! no supe como borrar cache, pero puedes hacerlo tu mismo"
echo >&2
echo >&2 " vendor/drush/drush/drush cr"
echo >&2
echo >&2 "========================================================================"

sleep 5

echo >&2 "========================================================================"
echo >&2
echo >&2 "                      !!!  LISTO EL POLLO !!!! "
echo >&2
echo >&2 " Ya puedes entrar al proyecto desde el navegador, ya esta listo Drupal8 "
echo >&2
echo >&2 " Para entrar a la administración usa las siguientes credenciales:       "
echo >&2
echo >&2 "                          Usuario : admin                               "
echo >&2 "                          Clave   : admin                               "
echo >&2
echo >&2 "                             GOOD LUCK                                  "
echo >&2
echo >&2 "========================================================================"