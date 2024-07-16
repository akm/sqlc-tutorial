SQLC_CLI?=$(shell go env GOPATH)/bin/sqlc
$(SQLC_CLI):
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

.PHONY: generate
generate: $(SQLC_CLI)
	$(SQLC_CLI) generate
