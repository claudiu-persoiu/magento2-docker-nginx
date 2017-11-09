#!/bin/bash

cd /etc/nginx/ssl

if [ ! -f ${APP_DOMAIN}.crt ]; then
    openssl genrsa -des3 -passout pass:x -out nginx.pass.key 2048
    openssl rsa -passin pass:x -in nginx.pass.key -out ${APP_DOMAIN}.key
    rm nginx.pass.key
    openssl req -new -key ${APP_DOMAIN}.key -out ${APP_DOMAIN}.csr -subj "/C=US/ST=California/L=Beverly Hills/O=${APP_DOMAIN}/OU=${APP_DOMAIN}/CN=${APP_DOMAIN}"
    openssl x509 -req -sha256 -days 365 -in ${APP_DOMAIN}.csr -signkey ${APP_DOMAIN}.key -out ${APP_DOMAIN}.crt
fi

for VAR in PHP_HOST PHP_PORT APP_MAGE_MODE APP_DOMAIN
do
    VALUE=${!VAR}
    [ ! -z "${VALUE}" ] && sed -i "s/${VAR}/${VALUE}/" /etc/nginx/conf.d/default.conf
done

cd /var/www/html

/usr/sbin/nginx -g "daemon off;"