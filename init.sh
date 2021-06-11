#!/bin/bash
#set -e
# Exporta las variables de ambiente para tenerlas disponibles en el bash
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

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
echo >&2 " 1. Descargando actualizacion de la rama develop "
echo >&2
echo >&2 "========================================================================"

git pull origin develop

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 1. Ejecutando composer install "
echo >&2
echo >&2 "========================================================================"

composer install

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 2. Copiando el archivo de backup a la carpeta para ejecutar "
echo >&2
echo >&2 "========================================================================"

cp backup/backup_initial.mysql $MYSQL_PATH/sql

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " 2. Copiando los archivos de configuracion settings.php y settings.local.php "
echo >&2
echo >&2 "========================================================================"

cp backup/settings.php ./web/sites/default
cp backup/settings.local.php ./web/sites/default

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " Se ubica en el directorio de Mysql "
echo >&2
echo >&2 "========================================================================"
cd $MYSQL_PATH

echo >&2 "========================================================================"
echo >&2
echo >&2 " Borra la base de datos $MYSQL_DATABASE "
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "DROP database $MYSQL_DATABASE;"

echo >&2 "========================================================================"
echo >&2
echo >&2 " Crea la base de datos $MYSQL_DATABASE"
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE database $MYSQL_DATABASE"

echo >&2 "========================================================================"
echo >&2
echo >&2 " Importa el backup en la base de datos $MYSQL_DATABASE"
echo >&2
echo >&2 "========================================================================"

./mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --default-character-set=utf8 $MYSQL_DATABASE < sql/backup_initial.mysql

