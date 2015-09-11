check := $(shell go version)
build:
ifeq ($(OS),Windows_NT)
	shell echo "Windows is currently not supported"
	shell exit /b 1
else
ifneq (,$(findstring go1.5,$(check)))
	@echo Running go 1.5
	go build -buildmode=c-shared -o hyperquest.so hyperquest.go
else
	@echo Can't compile natively, instead downloading binary from github.
	curl https://github.com/berfarah/hyperquest/1.0.0/hyperquest-`uname -s`-`uname -m`.tar.gz | tar zx
endif
endif

# These are required to install successfully
clean:
install:
