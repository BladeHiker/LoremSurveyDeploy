FROM mariadb:latest
WORKDIR /home
COPY LoremServer /home/LoremServer
COPY others /home/others
COPY others/html /usr/share/nginx/html/
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install mongodb python nginx -y
COPY others/nginx/nginx.conf /etc/nginx/nginx.conf
RUN nginx &
# RUN mysql -uroot -p3325111 < /home/others/mysql/LoremServer.sql
RUN mongo &
RUN nohup python LoremServer/manage.py runserver 127.0.0.1:8002 &

## docker build -t lorem .
## docker run --env MARIADB_PASSWORD="3325111" -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD="3325111" -e MARIADB_RANDOM_ROOT_PASSWORD="3325111" -d -p 5050:80 lorem