#!/bin/bash
#set -e
# Exporta las variables de ambiente para tenerlas disponibles en el bash
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Define la carpeta donde se almacenara el backup de la base de datos a ejecutar
FOLDER_SQL=$MYSQL_PATH/sql
FOLDER_LIBRARIES="web/libraries"

# Print the message to console
#echo >&2 "========================================================================"
echo >&2 "                     ___ __ __      ________                              "
echo >&2 "                    /__//_//_/\    /_______/\                             "
echo >&2 "                    \::\| \| \ \   \__.::._\/                             "
echo >&2 "                     \:.      \ \     \::\ \                              "
echo >&2 "                      \:.\-/\  \ \    _\::\ \__                           "
echo >&2 "                       \. \  \  \ \  /__\::\__/\                          "
echo >&2 "                        \__\/ \__\/  \________\/                          "
echo >&2 "                                                                          "
echo >&2 "  ______     ______      __  __     __    __     ______     ______        "
echo >&2 " /_____/\   /_____/\    /_/\/_/\   /_/\  /_/\   /_____/\   /_____/\       "
echo >&2 " \::::_\/_  \:::_ \ \   \:\ \:\ \  \:\ \ \ \ \  \::::_\/_  \:::_ \ \      "
echo >&2 "  \:\/___/\  \:(_) ) )_  \:\ \:\ \  \:\ \_\ \ \  \:\/___/\  \:(_) ) )_    "
echo >&2 "   \:::._\/   \: __  \ \  \:\ \:\ \  \:\__/.:\ \  \::___\/_  \: __  \ \   "
echo >&2 "    \:\ \      \ \  \ \ \  \:\_\:\ \  \ ..::/ /    \:\____/\  \ \  \ \ \  "
echo >&2 "     \_\/       \_\/ \_\/   \_____\/   \___/_/      \_____\/   \_\/ \_\/  "
echo >&2 "                                                                          "
#echo >&2 "========================================================================"

sleep 5

# Print the message to console
echo >&2 "                                                                        "
echo >&2
echo >&2 "          Generando rama develop (git checkout -b develop)              "
echo >&2 "========================================================================"

git checkout -b develop
sleep 3

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 "          Descargando actualizacion (git pull origin develop)           "
echo >&2 "========================================================================"

git pull origin develop
sleep 3

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 "              Descargando dependencias (composer install)               "
echo >&2 "========================================================================"

sleep 3
composer install

# Print the message to console
echo >&2 "========================================================================="
echo >&2
echo >&2 "        Copiando archivos de configuración a web/sites/default           "
echo >&2
echo >&2 "                  (settings.php y settings.local.php)                    "
echo >&2 "========================================================================="

cp backup/settings/settings.php ./web/sites/default
cp backup/settings/settings.local.php ./web/sites/default
sleep 3

echo >&2 "!! Archivos copiados correctamente !!                                    "

# Print the message to console
echo >&2 "========================================================================="
echo >&2
echo >&2 "       Copiando archivo de standard de programación (phpcs.xml)          "
echo >&2 "========================================================================="

cp backup/config/phpcs.xml .
sleep 3

echo >&2 "!! Archivo copiado correctamente !!                                     "

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " Copiando librerias de modulos Contrib (carpeta web/libraries)"
echo >&2 "========================================================================"

# Create the custom modules folder
if ! [ -d "$FOLDER_LIBRARIES" ]
then
  mkdir $FOLDER_LIBRARIES
fi

cp -R backup/libraries/* $FOLDER_LIBRARIES
sleep 3

echo >&2 "!! Librerias copiadas correctamente !!                                  "

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " Copiando el backup de la base de datos a $FOLDER_SQL"
echo >&2 "========================================================================"

# Create the custom modules folder
if ! [ -d "$FOLDER_SQL" ]
then
  mkdir $FOLDER_SQL
fi

cp backup/db/backup_initial.mysql $MYSQL_PATH/sql
sleep 3

echo >&2 "!! Backup copiado correctamente !!                                      "

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 "            Se cambia de directorio de trabajo a $MYSQL_PATH            "
echo >&2 "========================================================================"

cd $MYSQL_PATH
sleep 3

echo >&2 "!! Cambio a directorio $MYSQL_PATH correctamente !!                      "

echo >&2 "========================================================================"
echo >&2
echo >&2 "           Borra la base de datos $MYSQL_DATABASE si existe             "
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "DROP database $MYSQL_DATABASE;"
sleep 3

echo >&2 "========================================================================"
echo >&2
echo >&2 "            Crea la base de datos $MYSQL_DATABASE vacia                 "
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE database $MYSQL_DATABASE"
sleep 3
echo >&2 "!! Base de datos $MYSQL_DATABASE creada correctamente !!                "

echo >&2 "========================================================================"
echo >&2
echo >&2 "        Importa el backup en la base de datos $MYSQL_DATABASE           "
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --default-character-set=utf8 $MYSQL_DATABASE < sql/backup_initial.mysql
sleep 3

echo >&2 "!! Backup importado correctamente!!                                     "

sleep 4

echo >&2 "========================================================================"
echo >&2
echo >&2 "                        Borrando cache de Drupal"
echo >&2 "========================================================================"

sleep 4

echo >&2 " !Upps! no supe como borrar cache, pero puedes hacerlo tu mismo         "
echo >&2
echo >&2 "                vendor/drush/drush/drush cr                             "
echo >&2


sleep 5

echo >&2 "                                                                        "
echo >&2 "                                                                        "
echo >&2 "                      !!!  LISTO EL POLLO !!!!                          "
echo >&2 "                                                                        "
echo >&2 " Ya puedes entrar al proyecto desde el navegador, ya esta listo Drupal8 "
echo >&2 "                                                                        "
echo >&2 " Para entrar a la administración usa las siguientes credenciales:       "
echo >&2 "                                                                        "
echo >&2 "                          Usuario : admin                               "
echo >&2 "                          Clave   : admin                               "
echo >&2 "                                                                        "
echo >&2 "                             GOOD LUCK                                  "
echo >&2 "                                                                        "
echo >&2 "                                                                        "
echo >&2 "           ____    __    ____   _______    _______    __                "
echo >&2 "           \   \  /  \  /   /  |       \  |       \  |  |               "
echo >&2 "            \   \/    \/   /   |  .--.  | |  .--.  | |  |               "
echo >&2 "             \            /    |  |  |  | |  |  |  | |  |               "
echo >&2 "              \    /\    /     |  '--'  | |  '--'  | |   ----.          "
echo >&2 "               \__/  \__/      |_______/  |_______/  |_______|          "
echo >&2 "                                                                        "
echo >&2 "                                                                        "
echo >&2 "                                                                        "