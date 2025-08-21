#!/usr/bin/env bash

# Base directory containing source code
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Optional PLATFORM argument (if none provided, both will be built)
PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build one image
  then
    FILE="${DIR}"/"${TAG}"/_docker-tags.txt

    # Check if image has multiple tags (indicated by file existence)
    if [ -f "${FILE}" ]; then
      echo "${TAG} directory has multiple Docker tags"

      TAGS=""
      while IFS= read -r line; do
        TAGS="${TAGS} -t stephenneal/php-composer:${line}"
      done < "${DIR}"/"${TAG}"/_docker-tags.txt

      COMMAND="docker build ${TAGS} ${DIR}/${TAG}/"
      echo "${COMMAND}"
      $(echo "${COMMAND}")
    else
      docker buildx build \
      	--load \
      	-t stephenneal/php-composer:"${TAG}" \
      	--platform "${PLATFORM}" \
      	"${DIR}"/"${TAG}"/
    fi

  # Build all images
  else
    docker build -t stephenneal/php-composer:7.4-v1 "${DIR}"/7.4-v1/
    docker build -t stephenneal/php-composer:7.4-v2 "${DIR}"/7.4-v2/
    docker build -t stephenneal/php-composer:7.4-v4 "${DIR}"/7.4-v4/
    docker build -t stephenneal/php-composer:7.4-v4.1 "${DIR}"/7.4-v4.1/
    docker build -t stephenneal/php-composer:7.4-v5 "${DIR}"/7.4-v5/
    docker build -t stephenneal/php-composer:8.0-base "${DIR}"/8.0-base/
    docker build -t stephenneal/php-composer:8.0-medialibrary "${DIR}"/8.0-medialibrary/
    docker build -t stephenneal/php-composer:8.1-base "${DIR}"/8.1-base/
    docker build -t stephenneal/php-composer:8.1-medialibrary "${DIR}"/8.1-medialibrary/
    docker build -t stephenneal/php-composer:8.2-base "${DIR}"/8.2-base/
    docker build -t stephenneal/php-composer:8.2-medialibrary "${DIR}"/8.2-medialibrary/
    docker build -t stephenneal/php-composer:8.3-base "${DIR}"/8.3-base/
    docker build -t stephenneal/php-composer:8.3-medialibrary "${DIR}"/8.3-medialibrary/
    docker build -t stephenneal/php-composer:8.4-base "${DIR}"/8.4-base/
    docker build -t stephenneal/php-composer:8.4-medialibrary "${DIR}"/8.4-medialibrary/
fi
