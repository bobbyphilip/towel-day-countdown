BINARY_NAME=towelday
VERSION=0.1.0
MAINTAINER="Bobby Philip \<bobbyphilip@gmail.com\>"
DESCRIPTION="Use this to know how many days are left to international towel day"
PLATFORMS=amd64 arm64
BUILD_DIR=build

build:  ## Build the Go binary
	go build -o $(BINARY_NAME) main.go

run:    ## Build and execute the Go binary
	go run main.go


deb: $(PLATFORMS) ## Build a deb package for amd64 and arm64

$(PLATFORMS):   ## Build a deb package for a specific arch
	@echo "Building .deb for $@"
	
	mkdir -p $(BUILD_DIR)/$@/DEBIAN
	mkdir -p $(BUILD_DIR)/$@/usr/bin

	GOOS=linux GOARCH=$@ go build -o $(BUILD_DIR)/$@/usr/bin/$(BINARY_NAME) .

	@echo "Package: $(BINARY_NAME)" > $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Version: $(VERSION)" >> $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Section: utils" >> $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Priority: optional" >> $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Architecture: $@" >> $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Maintainer: $(MAINTAINER)" >> $(BUILD_DIR)/$@/DEBIAN/control
	@echo "Description: $(DESCRIPTION)" >> $(BUILD_DIR)/$@/DEBIAN/control
	# To add a dependency to your package, so that apt knows that you expect it
	#@echo 'Depends: libvlc5 (>= 3.0.0)' >> $(BUILD_DIR)/$@/DEBIAN/control

	dpkg-deb --build $(BUILD_DIR)/$@ $(BINARY_NAME)_$(VERSION)_$@.deb


clean: ## Delete the  build outputs
	rm -f $(BINARY_NAME)
	rm -rf $(BUILD_DIR) *.deb

help:     ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | column -tl 2

.PHONY: build run deb $(PLATFORMS) clean help

