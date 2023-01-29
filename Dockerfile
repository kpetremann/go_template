FROM golang:1.19-bullseye AS builder

WORKDIR /go/src/
COPY ./ /go/src/
RUN mkdir build
RUN go build -o /go/src/build/myapp

FROM debian:bullseye-slim AS runner
WORKDIR /app/
COPY --from=builder /go/src/build/myapp ./
CMD ["/app/myapp"]