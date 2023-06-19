FROM golang:1.19.9-alpine3.16 as builder

COPY ./ /app/hellogo
WORKDIR /app/hellogo

RUN go build

FROM alpine:3.16

COPY --from=builder /app/hellogo/hellogo /usr/local/bin

CMD ["hellogo"]