#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t stephenneal/php-composer:7.3-v1 "${DIR}"/v1/
docker build -t stephenneal/php-composer:7.3-v2 "${DIR}"/v2/
docker build -t stephenneal/php-composer:7.3-v3 "${DIR}"/v3/