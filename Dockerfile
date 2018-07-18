# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM gcr.io/rg-demo-1/golang-gcpdatastore:latest

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/rgregg/guestbook-go
COPY ./static /static

RUN go install github.com/rgregg/guestbook-go

# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/guestbook-go

# Document that the service listens on port 8080.
EXPOSE 8080