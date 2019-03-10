FROM golang:alpine

WORKDIR /go/src/github.com/raylin/go-ece

ENV GO111MODULE=on
ENV CGO_ENABLED 0
ENV GOOS linux
ENV GOARCH amd64

COPY go.mod .
RUN go mod download

COPY . .
RUN go test
