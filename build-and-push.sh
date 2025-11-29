#!/bin/bash

# Get current date for tagging
DATE=$(date +%Y%m%d)

echo "Building Docker image with multiple tags..."
docker build \
  -t ghcr.io/suchanek/lightrag_pagent:latest \
  -t egsuchanek/lightrag_pagent:latest \
  -t egsuchanek/lightrag_pagent:$DATE \
  .

echo "Pushing to Docker Hub..."
docker push egsuchanek/lightrag_pagent:latest
docker push egsuchanek/lightrag_pagent:$DATE

echo "Attempting to push to GitHub Container Registry..."
docker push ghcr.io/suchanek/lightrag_pagent:latest || echo "GitHub Container Registry push failed (check authentication)"

echo "Done! Image available at:"
echo "  - Docker Hub: egsuchanek/lightrag_pagent:latest"
echo "  - Docker Hub: egsuchanek/lightrag_pagent:$DATE"