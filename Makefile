VERSION    ?= dev
REPOSITORY ?= sysdig-mac
IMAGE      ?= $(REPOSITORY):$(VERSION)

BUILD_OPTIONS = -t $(IMAGE)
ifdef http_proxy
BUILD_OPTIONS += --build-arg http_proxy=$(http_proxy)
endif
ifdef https_proxy
BUILD_OPTIONS += --build-arg https_proxy=$(https_proxy)
endif
BUILD_OPTIONS += --build-arg application_version=$(VERSION)

RUN_OPTIONS = --privileged 
RUN_OPTIONS += -v /var/run/docker.sock:/host/var/run/docker.sock 
RUN_OPTIONS += -v /dev:/host/dev 
RUN_OPTIONS += -v /proc:/host/proc:ro 
RUN_OPTIONS += -v /lib/modules:/host/lib/modules:ro 
RUN_OPTIONS += -v /usr:/host/usr:ro

default: csysdig

build:
	docker build $(BUILD_OPTIONS) .

sysdig:
	docker run -it --rm $(RUN_OPTIONS) $(IMAGE) sysdig

csysdig:
	docker run -it --rm $(RUN_OPTIONS) $(IMAGE) csysdig
