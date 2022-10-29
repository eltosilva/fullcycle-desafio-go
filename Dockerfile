FROM golang:latest as compilador

WORKDIR /usr/src/app

COPY ./ola-mundo.go .
RUN go build ola-mundo.go

FROM alpine:latest

WORKDIR /usr/src

COPY --from=compilador /usr/src/app/ola-mundo .

CMD [ "./ola-mundo" ]