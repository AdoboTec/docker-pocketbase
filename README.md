# docker-pocketbase
UNOFFICIAL Pocketbase Docker Image

<a aria-label="Latest Pocketbase Version" href="https://github.com/pocketbase/pocketbase/releases" target="_blank">
  <img alt="Latest Pocketbase Version" src="https://img.shields.io/github/v/release/pocketbase/pocketbase?color=success&display_name=tag&label=latest&logo=docker&logoColor=%23fff&sort=semver&style=flat-square">
</a>

[PocketBase](https://pocketbase.io) is an open source Go backend.

## Docker Run
```bash
docker run --name pocketbase \
    -p 8080:8080 \
    -v <path>:/pb/ \
    ghcr.io/adobotec/docker-pocketbase:latest
```
## Docker Compose

docker-compose.example.yaml

```bash
version: '3.7'

services:
  pocketbase:
    image: ghcr.io/adobotec/docker-pocketbase:latest
    restart: unless-stopped
    ports:
      - 8080:8080
    volumes:
      - pocketbase-vol:/pb/
volumes:
  pocketbase-vol:
```

## Environment Variables
| Variable          | Description             | Default            |
| ----------------- | ----------------------- | ------------------ |
| PB_DATA           | PB Data Directory       | /pb/pb_data        |
| PB_PUBLIC         | PB Public Directory     | /pb/pb_public      |
| PB_MIGRATION      | PB Migration Directory  | /pb/pb_migrations  | 
| PB_ENCRYPTION_KEY | PB Encryption Key       | None               |