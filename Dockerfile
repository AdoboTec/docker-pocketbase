FROM alpine:latest AS builder

ARG VERSION

RUN apk add --no-cache \
    unzip \
    ca-certificates


# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/pocketbase_${VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

FROM alpine:latest

RUN addgroup -S pocketbase -g 1001 && \ 
    adduser -S pocketbase -G pocketbase -u 1001 -H -D

RUN apk add --no-cache \
    ca-certificates

USER pocketbase

COPY --from=builder /pb/ /pb/

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data", "--publicDir=/pb/pb_public"]