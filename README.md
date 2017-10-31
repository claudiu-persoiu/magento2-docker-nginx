# magento2-docker-nginx

Development box build from [nginx](https://hub.docker.com/_/nginx/) with [Magento 2](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/nginx.html) config and ssl.

At each run there will be a ssl self sign certificate created for the domain *localhost*.

If you don't need ssl you can use the [mageinferno/magento2-nginx](https://hub.docker.com/r/mageinferno/magento2-nginx/) as this box is derived from it.

# Variables

The following environment variables are used for Nginx configuration:

- `PHP_HOST`: (default: `phpfpm`) The hostname of the PHP container.
- `PHP_PORT`: (default: `9000`) The port of the PHP container.
- `APP_MAGE_MODE`: (default: `default`) Set the appropriate MAGE_MODE. 