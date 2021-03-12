# sfneal/php-composer

[![Build Status](https://travis-ci.com/sfneal/php-composer.svg?branch=master&style=flat-square)](https://travis-ci.com/sfneal/php-composer)
[![Total Downloads](https://img.shields.io/docker/pulls/stephenneal/php-composer?style=flat-square)](https://hub.docker.com/r/stephenneal/php-composer)
[![Latest Version](https://img.shields.io/docker/v/stephenneal/php-composer?sort=semver&style=flat-square)](https://hub.docker.com/r/stephenneal/php-composer)

php-composer is a php-cli based image with PHP & Docker extensions as well as composer preinstalled.

## Installation

Docker images can be pulled using the Docker CLI.

```bash
docker pull stephenneal/php-composer:8.0-v1
```

## Usage

Here's an example of a composer dependency installation portion of a Laravel Application's Dockerfile.  Once composer packages have been installed, the relevant directories can be copied to the final image.  Using a multi-step build allows the final image to be smaller by avoiding installing composer and its dependencies.

```dockerfile
# Build temp image to install composer dependencies
ARG php_composer_tag=8.0-v1
FROM stephenneal/php-composer:${php_composer_tag} AS composer

# Set working directory
WORKDIR /var/www

# Laravel .env file
ARG env_file_name=.env

# Composer install flags
ARG composer_flags="--no-scripts --no-autoloader --no-dev"

# Copy composer & yarn package files
COPY ["composer.json", "composer.lock", "/var/www/"]

# Install composer dependencies
RUN composer install ${composer_flags}
```

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

### Security

If you discover any security related issues, please email stephen.neal14@gmail.com instead of using the issue tracker.

## Credits

- [Stephen Neal](https://github.com/sfneal)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
