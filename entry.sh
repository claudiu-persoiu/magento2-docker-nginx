#!/bin/bash

cd /etc/nginx/ssl
openssl genrsa -des3 -passout pass:x -out nginx.pass.key 2048
openssl rsa -passin pass:x -in nginx.pass.key -out nginx.key
rm nginx.pass.key
openssl req -new -key nginx.key -out nginx.csr -subj "/C=US/ST=California/L=Beverly Hills/O=localhost/OU=localhost/CN=localhost"
openssl x509 -req -sha256 -days 365 -in nginx.csr -signkey nginx.key -out nginx.crt
cd /var/www/html

/usr/local/bin/start.sh