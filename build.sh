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

    # todo: remove after confirming this works
    LATEST=$(echo "${TAG::5}")
    docker tag stephenneal/php-composer:"${TAG}" stephenneal/php-composer:"${LATEST}"

  # Build all images
  else
    docker build -t stephenneal/php-composer:7.3-v1 "${DIR}"/7.3-v1/
    docker build -t stephenneal/php-composer:7.3-v2 "${DIR}"/7.3-v2/
    docker build -t stephenneal/php-composer:7.3-v3 "${DIR}"/7.3-v3/
    docker build -t stephenneal/php-composer:7.4-v1 "${DIR}"/7.4-v1/
    docker build -t stephenneal/php-composer:7.4-v2 "${DIR}"/7.4-v2/
    docker build -t stephenneal/php-composer:7.4-v4 "${DIR}"/7.4-v4/
    docker build -t stephenneal/php-composer:7.4-v4.1 "${DIR}"/7.4-v4.1/
    docker build -t stephenneal/php-composer:7.4-v5 "${DIR}"/7.4-v5/
    docker build -t stephenneal/php-composer:8.0-v1 "${DIR}"/8.0-v1/
    docker build -t stephenneal/php-composer:8.1-rc-v1 "${DIR}"/8.1-rc-v1/
    docker build -t stephenneal/php-composer:8.1-rc-v1.1 "${DIR}"/8.1-rc-v1.1/
    docker build -t stephenneal/php-composer:8.1-rc-v2 "${DIR}"/8.1-rc-v2/
fi
