#!bin/bash

if [ -d /var/lib/mysql/$DB_NAME ]
then
    echo the database already installed 
else
    echo running database installation 
    service mysql start
    mysql -u root -e "create database $DB_NAME; GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_PASS
    sleep 2
    service mysql stop
    echo database was installed
fi

echo running mariadb

exec mysqld_safe
