#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Optional PLATFORM argument (if none provided, both will be built)
PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    FILE="${DIR}"/"${TAG}"/_docker-tags.txt

    # Check if image has multiple tags (indicated by file existence)
    if [ -f "${FILE}" ]; then
      echo "${TAG} directory has multiple Docker tags"

      while IFS= read -r line; do
        docker buildx build \
			--push \
			-t stephenneal/php-composer:"${line}" \
			--platform "${PLATFORM}" \
			"${DIR}"/"${TAG}"/
      done < "${DIR}"/"${TAG}"/_docker-tags.txt
    else
      docker buildx build \
      	--push \
      	-t stephenneal/php-composer:"${TAG}" \
      	--platform "${PLATFORM}" \
      	"${DIR}"/"${TAG}"/
    fi


  # Build & push all images
  else
    bash "${DIR}"/build.sh

    docker push stephenneal/php-composer:7.4-v1
    docker push stephenneal/php-composer:7.4-v2
    docker push stephenneal/php-composer:7.4-v4
    docker push stephenneal/php-composer:7.4-v4.1
    docker push stephenneal/php-composer:7.4-v5
    docker push stephenneal/php-composer:8.0-base
    docker push stephenneal/php-composer:8.0-medialibrary
    docker push stephenneal/php-composer:8.1-base
    docker push stephenneal/php-composer:8.1-medialibrary
    docker push stephenneal/php-composer:8.2-base
    docker push stephenneal/php-composer:8.2-medialibrary
    docker push stephenneal/php-composer:8.3-base
    docker push stephenneal/php-composer:8.3-medialibrary
    docker push stephenneal/php-composer:8.4-base
    docker push stephenneal/php-composer:8.4-medialibrary
fi