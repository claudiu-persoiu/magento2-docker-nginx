FROM mageinferno/magento2-nginx:1.11-1
MAINTAINER Claudiu Persoiu claudiu@persoiu.ro

COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/ssl

COPY entry.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entry.sh

ENV APP_MAGE_MODE developer

CMD ["/usr/local/bin/entry.sh"]