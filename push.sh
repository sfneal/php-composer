#!/usr/bin/env bash

sh ./build.sh

docker push stephenneal/php-composer:v1
docker push stephenneal/php-composer:v2
docker push stephenneal/php-composer:v3