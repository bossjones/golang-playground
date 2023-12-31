# just manual: https://github.com/casey/just/#readme
# golang man: https://boyter.org/posts/how-to-start-go-project-2023/
# https://engineering.kablamo.com.au/posts/2018/just-tell-me-how-to-use-go-modules/
# https://devs.cloudimmunity.com/gotchas-and-common-mistakes-in-go-golang/index.html
# https://lets-go.alexedwards.net/
# https://go.dev/learn/

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
    go get -u github.com/onsi/ginkgo
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
    # The go mod vendor command constructs a directory named vendor in the main module's root directory that contains copies of all packages needed to support builds and tests of packages in the main module. Packages that are only imported by tests of packages outside the main module are not included. As with go mod tidy and other module commands, build constraints except for ignore are not considered when constructing the vendor directory.
    go mod vendor

# run go mod tidy
tidy:
    # go mod tidy ensures that the go.mod file matches the source code in the module. It adds any missing module requirements necessary to build the current module's packages and dependencies, and it removes requirements on modules that don't provide any relevant packages. It also adds any missing entries to go.sum and removes unnecessary entries.
    go mod tidy

# install cobra cli
cobra-cli-install:
    go install github.com/spf13/cobra-cli@latest

# setup cli dir structure
cobra-setup:
    cd cmd
    cobra-cli init . --author "bossjones" --viper
    cobra-cli add serve
    cobra-cli add config
    cobra-cli add prepare
    cobra-cli add create -p 'configCmd'
