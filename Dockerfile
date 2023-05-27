FROM golang:1.17-alpine

WORKDIR /opt

COPY . .

RUN go mod download
RUN go build -o app
RUN ls


FROM alpine:latest
WORKDIR /run
COPY --from=0 /opt/static ./static
COPY --from=0 /opt/app ./
RUN ls /run


EXPOSE 8080
CMD ["./app"]