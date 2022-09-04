# Building the image
FROM golang:alpine AS builder

WORKDIR /first-go-app

COPY main.go .

RUN go build -o webserver main.go

# Running the image

FROM alpine

WORKDIR /first-go-app

COPY --from=builder /first-go-app/webserver /first-go-app/webserver

CMD ["./webserver"]

EXPOSE 8080