USERNAME=tetov
VERSION=$(shell cat VERSION)

DOCKER=docker

.PHONY: all build

all: build

build: build-linux-arm64-kernel-xcompile

build-linux-arm64-kernel-xcompile:
	$(eval IMAGE:=linux-arm64-kernel-xcompile)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

release: release-linux-arm64-kernel-xcompile

release-linux-arm64-kernel-xcompile:
	$(eval IMAGE:=linux-arm64-kernel-xcompile)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)
