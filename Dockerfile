FROM alpine:latest AS builder

ARG IMG_VERSION=0

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${IMG_VERSION}/pocketbase_${IMG_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

FROM alpine:latest

COPY --from=builder /pb/pocketbase /pocketbase
COPY docker-entrypoint /

RUN addgroup -S pocketbase -g 1001 && \ 
    adduser -S pocketbase -G pocketbase -u 1001 -H -D 

RUN apk add --no-cache \
    ca-certificates

USER pocketbase

WORKDIR /pb

EXPOSE 8080

# Docker EntryPoint
ENTRYPOINT ["/docker-entrypoint"]

# Run Pocketbase serve command from docker-entrypoint
CMD ["serve"]
