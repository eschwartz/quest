#!/usr/bin/env bash
set -euo pipefail

# Kill any existing container
docker rm -fv quest-dev || true;

# Run the latest build of the quest image
# Mount in local source code
docker run \
    --name quest-dev \
    --detach \
    -p 80 \
    -v $(pwd)/src:/opt/quest/src \
    -v $(pwd)/bin:/opt/quest/bin \
    quest:latest;

echo <<EOF
Following logs for quest docker container
NOTE: Exiting logs will not terminate container.
To terminate the container, run:
    docker rm -fv quest-dev
EOF

echo "Listening on $(docker port quest-dev 80/tcp)"

# Follow logs
docker logs -f quest-dev;