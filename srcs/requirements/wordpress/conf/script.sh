#!/bin/bash
#https://developer.wordpress.org/cli/commands/

if [ -f /var/www/html/index.php ]
then
    echo running wordpress and php7.3-fpm
else
    
    cd /var/www/html
    wp core download --allow-root
    sleep 8
    wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WPS_TITLE --admin_user=$ADM_WPS_ACC --admin_password=$ADM_WPS_PWD --admin_email=$ADM_WPS_MAIL --allow-root
    wp user create user_one user_one@student.42.fr --role=subscriber --user_pass=$USR_WPS_PWD --display_name=user_one --user_nicename=user_one --allow-root
    wp theme install zeever --allow-root
    wp theme activate zeever --allow-root
    wp theme delete --all --allow-root
    rm -rf readme.html
    rm -rf license.html 
    chown www-data:www-data /var/www/html -R && chmod -R -wx,u+rwX,g+rX,o+rX /var/www/html
    echo wordpress installation down
    echo running wordpress and php7.3-fpm 
fi

exec php-fpm7.3 -R -F