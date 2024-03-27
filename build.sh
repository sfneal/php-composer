#!/usr/bin/env bash

# Base directory containing source code
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build one image
  then
    docker build -t stephenneal/php-composer:"${TAG}" "${DIR}"/"${TAG}"/

  # Build all images
  else
    docker build -t stephenneal/php-composer:7.1-v1 "${DIR}"/7.1-v1/
    docker build -t stephenneal/php-composer:7.2-v1 "${DIR}"/7.2-v1/
    docker build -t stephenneal/php-composer:7.3-v1 "${DIR}"/7.3-v1/
    docker build -t stephenneal/php-composer:7.3-v2 "${DIR}"/7.3-v2/
    docker build -t stephenneal/php-composer:7.3-v3 "${DIR}"/7.3-v3/
    docker build -t stephenneal/php-composer:7.3-v4 "${DIR}"/7.3-v4/
    docker build -t stephenneal/php-composer:7.4-v1 "${DIR}"/7.4-v1/
    docker build -t stephenneal/php-composer:7.4-v2 "${DIR}"/7.4-v2/
    docker build -t stephenneal/php-composer:7.4-v4 "${DIR}"/7.4-v4/
    docker build -t stephenneal/php-composer:7.4-v4.1 "${DIR}"/7.4-v4.1/
    docker build -t stephenneal/php-composer:7.4-v5 "${DIR}"/7.4-v5/
    docker build -t stephenneal/php-composer:8.0-v1 "${DIR}"/8.0-v1/
    docker build -t stephenneal/php-composer:8.0-v2 "${DIR}"/8.0-v2/
    docker build -t stephenneal/php-composer:8.1-v1 "${DIR}"/8.1-v1/
    docker build -t stephenneal/php-composer:8.1-v2 "${DIR}"/8.1-v2/
    docker build -t stephenneal/php-composer:8.1-rc-v1 "${DIR}"/8.1-rc-v1/
    docker build -t stephenneal/php-composer:8.1-rc-v1.1 "${DIR}"/8.1-rc-v1.1/
    docker build -t stephenneal/php-composer:8.1-rc-v2 "${DIR}"/8.1-rc-v2/
    docker build -t stephenneal/php-composer:8.2-v1 "${DIR}"/8.2-v1/
    docker build -t stephenneal/php-composer:8.2-v2 "${DIR}"/8.2-v2/
    docker build -t stephenneal/php-composer:8.3-v1 "${DIR}"/8.3-v1/
    docker build -t stephenneal/php-composer:8.3-v2 "${DIR}"/8.3-v2/
fi
