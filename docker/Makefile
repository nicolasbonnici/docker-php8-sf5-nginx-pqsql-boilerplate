# Define the default target
.DEFAULT_GOAL := help

# Define colors for output
COLOR_RESET   := \033[0m
COLOR_INFO    := \033[32m
COLOR_COMMENT := \033[33m

# Help target (displays available targets)
help:
	@echo "$(COLOR_INFO)Available targets:$(COLOR_RESET)"
	@awk '/^[a-zA-Z_-]+:/ { \
		nb = sub( /^## /, "", helpMsg ); \
		if(nb == 0) { \
			helpMsg = $$0; \
			nb = sub( /^[^:]*:.* ## /, "", helpMsg ); \
		} \
		if ( nb ) { \
			printf "$(COLOR_COMMENT)%-20s$(COLOR_RESET)%s\n", $$1, helpMsg; \
			helpMsg = ""; \
		} \
	}' $(MAKEFILE_LIST)

## Build Docker Compose services with no cache
build:
	docker compose build --no-cache
# Usage: make build

## Start Docker Compose services, pull images and wait for them to be up
up:
	docker compose up --pull --wait
# Usage: make up

## Stop and remove Docker Compose services
down:
	docker compose down --remove-orphans
# Usage: make down
