# some example commands for docker containers

# start the containers in the docker-compose.yml file
docker-compose up -d
#stop the containers
docker-compose down

# import mysql database dump
docker exec fripan_mysql5.7 sh -c 'exec mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /var/www/html/data/database.sql'
docker exec fripan_mysql5.7 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /var/www/html/data/database.sql'
# create a database dump
docker exec instance_name sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /var/www/html/data/databases.sql

# run a container and enter shell
docker run -it --rm php:7.4 bash

# open mysql command line client
docker run -it --network opencart30-network --rm mysql:5.7 mysql -hopencart30-db -uroot -p


# install laravel through the composer container
docker run --rm --interactive --tty --volume $PWD/app:/app composer global require laravel/installer && composer create-project --prefer-dist laravel/laravel app
