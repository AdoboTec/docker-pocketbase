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
    adobotec/pocketbase:latest 
```
## Docker Compose

docker-compose.example.yaml

```bash
version: '3.7'

services:
  pocketbase:
    image: adobotec/pocketbase:latest 
    restart: unless-stopped
    ports:
      - 8080:8080
    volumes:
      - pocketbase-data:/pb/pb_data
      - pocketbase-public:/pb/pb_public
volumes:
  pocketbase-data:
  pocketbase-public:
```