# docker-pocketbase
UNOFFICIAL Pocketbase Docker Image

[PocketBase](https://pocketbase.io) is an open source Go backend.

## Docker Run
```bash
docker run --name pocketbase \
    -p 8080:8080 \
    -v pocketbase-data:/pb/pb_data \
    -v pocketbase-public:/pb/pb_public \
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