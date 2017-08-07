# docker-lamp

docker-compose

docker exec -it mysql-db  /bin/bash

sudo docker run --net=host  --name mysql-8.0   -e MYSQL_DATABASE=test -e MYSQL_ALLOW_EMPTY_PASSWORD=yes  -v $PWD/config/my.cnf:/etc/my.cnf -d mysql