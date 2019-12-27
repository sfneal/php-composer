#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sh "${DIR}"/build.sh

docker push stephenneal/php-composer:7.3-v1
docker push stephenneal/php-composer:7.3-v2
docker push stephenneal/php-composer:7.3-v3