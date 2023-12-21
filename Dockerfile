FROM golang:alpine3.14 as builder

LABEL com.epoch.company="digitalcode"
LABEL com.epoch.version="1.0.0"
LABEL com.epoch.description="Dockerfile for FullCycle training 3.0"
LABEL com.epoch.course="Docker"
LABEL com.epoch.challenge="Desafio Go"
LABEL com.epoch.date="20231221"

WORKDIR /src

COPY ./src/* .

RUN go build -o app main.go


## Deploy
## Strach base debian, serve para imagens super mínimas(Que contém apenas um único binários)
FROM scratch as deploy

WORKDIR /

COPY --from=builder /src/app /app

EXPOSE 8080

ENTRYPOINT ["/app"]
