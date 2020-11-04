FROM golang:alpine AS builder

WORKDIR /app

RUN apk update && apk add git \
    && git clone https://github.com/jzl1/E5SubBot.git \
    && cd E5SubBot && go build

FROM alpine:latest

ENV TIME_ZONE=Asia/Shanghai

RUN apk update && apk add tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

WORKDIR /app

COPY --from=builder /app/E5SubBot/main /app
COPY --from=builder /app/E5SubBot/start.sh /app
RUN chmod +x /app/*

CMD [ "/app/start.sh" ]
