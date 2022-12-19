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

RUN addgroup -S pocketbase -g 1001 && \ 
    adduser -S pocketbase -G pocketbase -u 1001 -H -D 

RUN apk add --no-cache \
    ca-certificates

USER pocketbase

WORKDIR /pb

EXPOSE 8080

# start PocketBase
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data", "--publicDir=/pb/pb_public"]