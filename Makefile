SOURCES := $(shell find . -name '*.go')
BINARY := test-drive
IMAGE_TAG := dev
IMAGE := smclernon/trivy-action-test-drive:$(IMAGE_TAG)

build: $(BINARY)

test: build
	GO111MODULE=on go test -v -short -race -coverprofile=coverage.txt -covermode=atomic ./...

$(BINARY): $(SOURCES)
	GOOS=linux GO111MODULE=on CGO_ENABLED=0 go build -o $(BINARY) cmd/test-drive/main.go

docker-build: build
	docker build --no-cache -t $(IMAGE) .
