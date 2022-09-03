
# syntax=docker/dockerfile:1
# ↑Dockerビルダーが、Dockerfileをパースする際に、Dockerfileが古い場合はアップデートしてくれる記述。

FROM golang:1.19.0-alpine3.16

WORKDIR /app

# Download Go modules
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY *.go ./

RUN go build -o /docker-test

EXPOSE 8080

CMD [ "/docker-test" ]
