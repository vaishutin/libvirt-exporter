FROM golang:1.26-alpine AS build
ARG TARGETARCH
ARG VERSION=project-uuid
RUN apk add --no-cache ca-certificates gcc musl-dev linux-headers libvirt-dev libxml2-dev pkgconf
WORKDIR /build
COPY . .
RUN CGO_ENABLED=1 go test -mod=vendor ./...
RUN CGO_ENABLED=1 GOARCH=$TARGETARCH go build -mod=vendor -ldflags="-X main.Version=${VERSION}" -o /out/libvirt-exporter .
FROM alpine:3.23
RUN apk add --no-cache ca-certificates libvirt libxml2
COPY --from=build /out/libvirt-exporter /libvirt-exporter
EXPOSE 9177
ENTRYPOINT ["/libvirt-exporter"]
