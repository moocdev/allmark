FROM golang:1.5
MAINTAINER Andreas Koch <andy@allmark.io>

# Install pandoc for RTF conversion
RUN apt-get update && apt-get install -qy pandoc

# Build
ADD . /go
RUN go run make.go -crosscompile

# Data
RUN mkdir /data
ADD . /data

VOLUME ["/data"]

CMD ["/go/bin/linux/amd64/allmark", "serve", "/data"]
