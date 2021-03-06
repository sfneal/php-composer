#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    sh "${DIR}"/build.sh "${TAG}"
    docker push stephenneal/php-composer:"${TAG}"

  # Build & push all images
  else
    sh "${DIR}"/build.sh

    docker push stephenneal/php-composer:7.3-v1
    docker push stephenneal/php-composer:7.3-v2
    docker push stephenneal/php-composer:7.3-v3
    docker push stephenneal/php-composer:7.4-v1
    docker push stephenneal/php-composer:7.4-v2
    docker push stephenneal/php-composer:7.4-v4
    docker push stephenneal/php-composer:7.4-v4.1
    docker push stephenneal/php-composer:7.4-v5
    docker push stephenneal/php-composer:8.0-v1
    docker push stephenneal/php-composer:rc-v1
    docker push stephenneal/php-composer:rc-v1.1
    docker push stephenneal/php-composer:rc-v2
fi