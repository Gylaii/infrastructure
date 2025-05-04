#!/bin/bash
set -e

# All repos go here
ROOT_DIR=$(pwd)
SERVICES=("api-gateway" "user-service")

# Check if we're in infra repo
if [ ! -f "docker-compose.yml" ]; then
  echo "Human mistake: startup script from the root of infrastructure repo"
  exit 1
fi

# Clone services
for service in "${SERVICES[@]}"; do
  if [ ! -d "../$service" ]; then
    echo "Cloning $service..."
    cd ..
    git clone https://github.com/Gylaii/$service.git
    cd $ROOT_DIR
  fi
done

echo "Gulaii microservices system startup..."
docker-compose up -d

echo "✅ Services started successfully!"
echo "API Gateway is available at http://localhost:8080"
echo "User Service is available at http://localhost:8081"
echo "KeyDB is mapped to host port 6399"
echo "User Service PostgreSQL is mapped to host port 5455"
