# just manual: https://github.com/casey/just/#readme
# golang man: https://boyter.org/posts/how-to-start-go-project-2023/

# Ignore the .env file that is only used by the web service
set dotenv-load := false

_default:
	@just --list

# Duplicate Code Detector (dcd)
# https://github.com/boyter/dcd

# install go deps
deps-install-libaries:
    go get -u github.com/boyter/dcd
    go get -u github.com/spf13/cobra@latest
    go get -u github.com/golang/mock
    go get -u github.com/imdario/mergo
    go get -u github.com/onsi/ginkgo/v2
	go get -u github.com/onsi/gomega
	go get -u github.com/pborman/uuid
	go get -u github.com/fsnotify/fsnotify
	go install github.com/go-delve/delve/cmd/dlv@latest

# For commands which have package main

# (main.go) builds the command and leaves the result in the current working directory.
# (packages) builds your package then discards the results.
build:
    go build

# (main.go) builds the command in a temporary directory then moves it to $GOPATH/bin.
# builds then installs the package in your $GOPATH/pkg directory.
install:
    go install

# vendor go deps
vendor:
    go mod vendor

# run go mod tidy
tidy:
    go mod tidy

# install cobra cli
cobra-cli-install:
    go install github.com/spf13/cobra-cli@latest
