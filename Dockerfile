FROM scratch
EXPOSE 8080
ENTRYPOINT ["/croc-hunter-argo"]
COPY config.json /
COPY ./bin/ /
COPY static/ static/
