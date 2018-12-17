FROM alpine:3.8
MAINTAINER Eason Summer <kszym2002@gmail.com>

RUN apk --no-cache --virtual  exts add          \
                            php7                \
                            php7-gd             \
                            php7-fpm            \
                            php7-xml            \
                            php7-zip            \
                            php7-xsl            \
                            php7-pdo            \
                            php7-dom            \
			    php7-fileinfo       \
                            php7-soap           \
                            php7-curl           \
                            php7-json           \
                            php7-phar           \
                            php7-zlib           \
                            php7-exif           \
                            php7-intl           \
                            php7-iconv          \
                            php7-mcrypt         \
                            php7-mysqli         \
                            php7-openssl        \
                            php7-opcache        \
                            php7-mbstring       \
                            php7-xmlreader      \
                            php7-pdo_mysql      \
                            php7-simplexml      \
                            php7-tokenizer      \
                            php7-xmlwriter   && \
           apk --no-cache --virtual run-times add \
                            curl                \
			    dcron               \
                            ca-certificates  

     
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
RUN crontab -l | { cat;echo "* * * * * php /root/ddns_namesilo.php";}           | crontab -     && \

ADD . /root

CMD CMD crond &&\ 
     php /root/ddns_namesilo.php
       
