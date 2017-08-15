# docker-lanmrp

###构建：

docker-compose build .

###运行

docker-compose up -d

###构建并运行

docker-compose up --build -d

###初始化

docker exec  httpd-php /usr/local/bin/composer_start.sh

##常用命名：


docker exec -it mysql-db  /bin/bash


docker images |grep none |awk {print }|xargs docker rmi -f


docker ps -a | awk {print } | xargs docker rm


docker ps -a | awk {print } | xargs docker rm


docker images |grep none |xargs docker rmi

