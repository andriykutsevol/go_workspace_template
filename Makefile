GOPATH_DIR := $(PWD)
GOPATH_DIR := $(shell dirname $(GOPATH_DIR))

set_vars:
	go env -w GO111MODULE=on
	mkdir -p ../GOPATH
	go env -w GOPATH=$(GOPATH_DIR)/GOPATH


set_main_module:
	$(MAKE) set_vars
	rm -f go.mod go.sum go.work			#we gitignore these files.
	go mod init github.com/andriykusevol/go_workspace_template



setup_workspace:
	$(MAKE) set_main_module
	go work init
	go work use .
	$(shell cd ./math && go mod init go_workspace_template/math)
	@echo $(PWD)
	go work use ./math/
	$(shell cd ./crypto && go mod init go_workspace_template/crypto)
	go work use ./crypto/


install_deps:
	$(MAKE) setup_workspace
	go mod tidy

build:
	$(MAKE) set_vars
	go build

install:
	$(MAKE) set_vars
	go install	


run_service:
	$(MAKE) set_vars
	go run .	

test:
	$(MAKE) set_vars
	go test -v ./...