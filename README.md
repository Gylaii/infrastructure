# Gulaii Microservices Infrastructure

This repository contains the Docker infrastructure setup for the Gulaii
microservices system.

## Quick Start for Frontend Developers

To run the entire backend system:

1. Clone this repository:

   ```bash
   git clone https://github.com/Gylaii/infrastructure.git
   cd infrastructure
   ```

2. Run the startup script:

```bash
sh startup.sh
```

3. Wait for the services to start (this may take several minutes for the first
   run as Gradle downloads dependencies)

> [!NOTE]  
> Optionally you can read logs to checkup on system: `docker-compose logs -f`

4. Once running, the following services will be available:

```
API Gateway: http://localhost:8080
User Service: http://localhost:8081
```

## What's in this docker compose

1. `KeyDB`: Message broker for inter-service communication
2. `API Gateway`: Entry point for frontend clients; protects gulaii
   microservices backend
3. `User Service`: Handles user authentication and management
4. `PostgreSQL`: Database for the user service

## Troubles

- If you see "Connection refused" errors in the logs, wait a few minutes. The
  services are still starting up.
- First-time builds can take 2-3 minutes as Gradle downloads dependencies.

If services fail to start, try rebuilding with:

```bash
docker-compose down -v
docker-compose up -d --build
```

## How to add your service here

1. Create a repo for your service
2. Add simple dockerfile (look at api gateway and user service). It should just
   copy your project and do `gradle run`.
3. Ensure you're using correct keydb env variables
4. Add your service to `docker-compose.yml` (make sure to use unique port)
5. If you're using databases - add your new volume to the `volumes` section
6. Add your service to `startup.sh` script
