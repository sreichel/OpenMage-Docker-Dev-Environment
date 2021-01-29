#!/bin/bash

#
# docker settings which can be modified if desired
#
DB_SCHEMA=openmage

#
# docker settings which should not be altered
#
DB_HOST=mysql-80
PROJECT_DIR=$(realpath $(dirname $0)/..)

#
# init database
#
echo "Initialising database"
echo "CREATE SCHEMA IF NOT EXISTS \`${DB_SCHEMA}\` DEFAULT CHARACTER SET utf8;" | mysql -u root -h ${DB_HOST}

#
# install dependencies
#
echo "Installing dependencies"
cd "${PROJECT_DIR}"
composer install --prefer-source

#
# shared folders
#
echo "Creating shared folder"
mkdir -p ${PROJECT_DIR}/shared/var
mkdir -p ${PROJECT_DIR}/shared/media
