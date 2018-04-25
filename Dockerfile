FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update wget git make bash bash-completion gcc

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
ENV GOCACHE=/go-cache

RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
	tar zxf go1.10.1.linux-amd64.tar.gz && \
	rm -f go1.10.1.linux-amd64.tar.gz

RUN go get golang.org/x/crypto ;\
	go get golang.org/x/image ;\
	go get golang.org/x/net ;\
	go get golang.org/x/oauth2 ;\
	go get golang.org/x/sys ;\
	go get golang.org/x/text ;\
	go get golang.org/x/time ;\
	rm -rf $(find $GOPATH/src -type d -name .git)
