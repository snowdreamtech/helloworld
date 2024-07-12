FROM snowdreamtech/go:1.22.5 AS builder
ENV GO111MODULE=auto
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o hello .

FROM alpine
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]