# magento2-docker-nginx

Development box build from [nginx](https://hub.docker.com/_/nginx/) with [Magento 2](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/nginx.html) config and ssl.

At each run there will be a test for a certificate for the domain in *APP_DOMAIN* variable.

If the certificate does not exist, a new self sign certificate be created in: `/etc/nginx/ssl`.

To prevent the container from creating a new certificate at each run add a storage map to folder `/etc/nginx/ssl`.

If you don't need ssl you can use the [mageinferno/magento2-nginx](https://hub.docker.com/r/mageinferno/magento2-nginx/) as this box is derived from it.

# Variables

The following environment variables are used for Nginx configuration:

- `PHP_HOST`: (default: `phpfpm`) The hostname of the PHP container.
- `PHP_PORT`: (default: `9000`) The port of the PHP container.
- `APP_MAGE_MODE`: (default: `developer`) Set the appropriate MAGE_MODE. 
- `APP_DOMAIN`: (default: `localhost`) Set app domain name
