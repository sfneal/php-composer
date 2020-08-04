#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t stephenneal/php-composer:7.3-v1 "${DIR}"/7.3-v1/
docker build -t stephenneal/php-composer:7.3-v2 "${DIR}"/7.3-v2/
docker build -t stephenneal/php-composer:7.3-v3 "${DIR}"/7.3-v3/
docker build -t stephenneal/php-composer:7.4-v1 "${DIR}"/7.4-v1/
docker build -t stephenneal/php-composer:7.4-v2 "${DIR}"/7.4-v2/
docker build -t stephenneal/php-composer:7.4-v4 "${DIR}"/7.4-v4/
docker build -t stephenneal/php-composer:7.4-v4.1 "${DIR}"/7.4-v4.1/
docker build -t stephenneal/php-composer:8.0-rc-v1 "${DIR}"/8.0-rc-v1/
docker build -t stephenneal/php-composer:8.0-rc-v1.1 "${DIR}"/8.0-rc-v1.1/