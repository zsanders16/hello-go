FROM registry1.dso.mil/ironbank/google/golang/golang-1.14@sha256:ec735544ee7e69ccc52461ca53ea2a390b77142cb3e7b98f839e3d3296fe189c

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 

USER 0

RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
ADD . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app
## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]