FROM php:7.4.13-fpm-alpine3.12

RUN git clone https://github.com/laynefyc/xhgui-branch.git 

COPY ./entrypoint.sh /var/www/

ENTRYPOINT ["/bin/sh", "/var/www/entrypoint.sh"]
