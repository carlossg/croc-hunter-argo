FROM golang:1.20.1 AS builder
COPY .git/ ./src/
COPY Makefile ./src/
COPY go.mod ./src/
COPY croc-hunter.go ./src/
RUN cd src && make


FROM scratch
EXPOSE 8080
ENTRYPOINT ["/croc-hunter-argo"]
COPY --from=builder /go/src/config.json /
COPY --from=builder /go/src/bin/ /
COPY static/ static/
