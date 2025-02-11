FROM golang:1.14 as builder
WORKDIR /go/src/github.com/CxZMoE/hmq
COPY . .
RUN CGO_ENABLED=0 go build -o hmq -a -ldflags '-extldflags "-static"' .


FROM alpine:3.8
WORKDIR /
COPY --from=builder /go/src/github.com/CxZMoE/hmq/hmq .
EXPOSE 1883

CMD ["/hmq"]