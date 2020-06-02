FROM alpine:3.10.2

COPY test-drive /app/test-drive

ENTRYPOINT ["/app/test-drive"]
