#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Testing Ludo Game Docker Build Process Locally${NC}"

# Build development image
echo -e "${GREEN}Building development image...${NC}"
docker build --target development -t ludo-game:dev .

# Run tests
echo -e "${GREEN}Running tests...${NC}"
docker run --rm ludo-game:dev npm test

# Build production image
echo -e "${GREEN}Building production image...${NC}"
docker build --target production -t ludo-game:prod .

# Test production container
echo -e "${GREEN}Testing production container...${NC}"
docker run -d --name ludo-test -p 8080:80 ludo-game:prod

sleep 5

# Check health
if curl -f http://localhost:8080/health; then
    echo -e "${GREEN}Health check passed!${NC}"
else
    echo -e "${RED}Health check failed!${NC}"
    docker logs ludo-test
    docker stop ludo-test
    docker rm ludo-test
    exit 1
fi

# Cleanup
docker stop ludo-test
docker rm ludo-test

echo -e "${GREEN}All tests passed! Ready for deployment.${NC}"