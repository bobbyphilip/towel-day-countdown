BINARY_NAME=towelday
all: build execute

build:
	go build -o $(BINARY_NAME) main.go

run:
	go run main.go

execute:
	@./$(BINARY_NAME)

clean:
	rm -f $(BINARY_NAME)

.PHONY: all build run execute clean

