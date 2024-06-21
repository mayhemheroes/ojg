FROM golang:1.19.1-buster as go-target
ADD . /ojg
WORKDIR /ojg/cmd/oj
RUN go build
ADD corpus .
FROM golang:1.19.1-buster
COPY --from=go-target /ojg/cmd/oj/oj /
COPY --from=go-target /ojg/corpus/* /testsuite/

ENTRYPOINT []
CMD ["/oj", "@@"]
