FROM golang:1.17.3-alpine3.15 AS build

ARG VERSION
ENV VERSION=${VERSION:-development}

ENV LIBVIRT_EXPORTER_PATH=/libvirt-exporter
RUN apk add --no-cache ca-certificates g++ git libnl-dev linux-headers make libvirt-dev libvirt libxml2-dev && \
    mkdir -p $LIBVIRT_EXPORTER_PATH
WORKDIR $LIBVIRT_EXPORTER_PATH
COPY . .

RUN go build -ldflags="-X 'main.Version=${VERSION}'" -mod vendor

FROM alpine:3.15
RUN apk add --no-cache ca-certificates libvirt libxml2
COPY --from=build $LIBVIRT_EXPORTER_PATH/libvirt-exporter /
EXPOSE 9177

ENTRYPOINT [ "/libvirt-exporter" ]
