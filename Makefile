.PHONY: help build build-dev build-prod up up-dev up-prod down down-dev down-prod test test-unit test-integration test-acceptance test-behat test-e2e deploy clean logs

# Default target
help:
	@echo "Symfony Vue Starter - Makefile Commands"
	@echo ""
	@echo "Development:"
	@echo "  make build-dev        - Build development Docker images"
	@echo "  make up-dev           - Start development environment"
	@echo "  make down-dev         - Stop development environment"
	@echo ""
	@echo "Production:"
	@echo "  make build-prod       - Build production Docker images"
	@echo "  make up-prod          - Start production environment"
	@echo "  make down-prod        - Stop production environment"
	@echo ""
	@echo "Testing:"
	@echo "  make test             - Run all tests"
	@echo "  make test-unit        - Run PHP unit tests (PEST)"
	@echo "  make test-integration - Run integration tests (PEST)"
	@echo "  make test-acceptance  - Run acceptance tests (PEST)"
	@echo "  make test-behat       - Run behavior tests (Behat)"
	@echo "  make test-e2e         - Run e2e tests (Playwright)"
	@echo ""
	@echo "Deployment:"
	@echo "  make deploy           - Deploy to production (requires confirmation)"
	@echo ""
	@echo "Utilities:"
	@echo "  make logs             - Show container logs"
	@echo "  make clean            - Clean up containers, volumes, and cache"

# Build targets
build: build-dev

build-dev:
	@echo "Building development Docker images..."
	cd docker/dev && docker compose build

build-prod:
	@echo "Building production Docker images..."
	cd docker/prod && docker compose build

# Up targets
up: up-dev

up-dev:
	@echo "Starting development environment..."
	cd docker/dev && docker compose up -d
	@echo "Services running:"
	@echo "  Frontend: http://localhost:3000"
	@echo "  Backend API: http://localhost:8000"
	@echo "  Sentry: http://localhost:9000"

up-prod:
	@echo "Starting production environment..."
	@if [ ! -f docker/prod/.env.prod ]; then \
		echo "Error: .env.prod file not found. Copy .env.prod.example and configure it."; \
		exit 1; \
	fi
	cd docker/prod && docker compose --env-file .env.prod up -d
	@echo "Production environment is running"

# Down targets
down: down-dev

down-dev:
	@echo "Stopping development environment..."
	cd docker/dev && docker compose down

down-prod:
	@echo "Stopping production environment..."
	cd docker/prod && docker compose down

# Test targets
test: test-unit test-integration test-acceptance test-behat test-e2e

test-unit:
	@echo "Running unit tests with PEST..."
	cd backend && ./vendor/bin/pest --filter=unit

test-integration:
	@echo "Running integration tests with PEST..."
	cd backend && ./vendor/bin/pest --filter=integration

test-acceptance:
	@echo "Running acceptance tests with PEST..."
	cd backend && ./vendor/bin/pest --filter=acceptance

test-behat:
	@echo "Running behavior tests with Behat..."
	cd backend && ./vendor/bin/behat

test-e2e:
	@echo "Running e2e tests with Playwright..."
	cd frontend && npm run test:e2e

# Deploy target
deploy:
	@echo "WARNING: This will deploy to production!"
	@echo "Press Ctrl+C to cancel, or wait 5 seconds to continue..."
	@sleep 5
	@echo "Deploying to production..."
	make build-prod
	make down-prod
	make up-prod
	@echo "Deployment complete!"

# Utility targets
logs:
	@echo "Showing container logs (Ctrl+C to exit)..."
	cd docker/dev && docker compose logs -f

clean:
	@echo "Cleaning up..."
	cd docker/dev && docker compose down -v
	cd docker/prod && docker compose down -v
	cd backend && rm -rf var/cache/* var/log/*
	cd frontend && rm -rf dist node_modules/.vite
	@echo "Clean complete!"
