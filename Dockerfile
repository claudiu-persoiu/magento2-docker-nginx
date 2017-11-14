FROM nginx:1.11
MAINTAINER Claudiu Persoiu claudiu@persoiu.ro

COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/ssl

COPY entry.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entry.sh

ENV PHP_HOST phpfpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default
ENV APP_DOMAIN localhost

CMD ["/usr/local/bin/entry.sh"]