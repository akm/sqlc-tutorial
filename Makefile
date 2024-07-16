SQLC_CLI?=$(shell go env GOPATH)/bin/sqlc
$(SQLC_CLI):
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

.PHONY: generate
generate: $(SQLC_CLI)
	$(SQLC_CLI) generate

.PHONY: db-up
db-up:
	docker-compose up -d

.PHONY: db-down
db-down:
	docker-compose down

.PHONY: db-wait
db-wait:
	sleep 1 && mysqladmin -u root -h 127.0.0.1 --wait --count 3 ping || exit 1

.PHONY: db-setup
db-setup: db-up db-wait
	mysql -u root -h 127.0.0.1 sqlc-tutorial1 < schema.sql

.PHONY: db-teardown
db-teardown: db-up
	echo "DROP TABLE authors;" | mysql -u root -h 127.0.0.1 sqlc-tutorial1

.PHONY: run
run:
	go run .
