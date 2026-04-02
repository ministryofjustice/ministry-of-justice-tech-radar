# Makefile for Ministry of Justice Tech Radar
# Makes local development and deployment easier

.PHONY: help install build serve clean docker-build docker-run docker-stop test validate

# Default target - show help
help:
	@echo "Ministry of Justice Technology Radar - Make targets:"
	@echo ""
	@echo "  make install       - Install dependencies"
	@echo "  make build         - Build the tech radar"
	@echo "  make serve         - Run local development server"
	@echo "  make clean         - Clean build artifacts"
	@echo ""
	@echo "  make docker-build  - Build Docker image"
	@echo "  make docker-run    - Run tech radar in Docker"
	@echo "  make docker-stop   - Stop Docker container"
	@echo ""
	@echo "  make validate      - Validate configuration files"
	@echo "  make test          - Run all checks (validate + build)"
	@echo ""
	@echo "  make setup         - First-time setup (install + validate)"

# Install dependencies
install:
	@echo "Installing dependencies..."
	npm ci

# Build the tech radar
build:
	@echo "Building tech radar..."
	npm run build

# Run local development server
serve:
	@echo "Starting local server..."
	@echo "The radar will be available at http://localhost:3000"
	npm run serve

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf build/ .techradar/ node_modules/.cache

# Clean everything including dependencies
clean-all: clean
	@echo "Removing node_modules..."
	rm -rf node_modules/

# Docker operations
docker-build:
	@echo "Building Docker image..."
	docker build -t moj-tech-radar:local .

docker-run:
	@echo "Running tech radar in Docker..."
	@echo "The radar will be available at http://localhost:3000"
	docker run -d --name moj-tech-radar -p 3000:3000 moj-tech-radar:local

docker-stop:
	@echo "Stopping Docker container..."
	docker stop moj-tech-radar || true
	docker rm moj-tech-radar || true

docker-logs:
	@echo "Showing Docker logs..."
	docker logs -f moj-tech-radar

# Validate configuration files
validate:
	@echo "Validating configuration files..."
	@echo "Checking config.json..."
	@node -e "JSON.parse(require('fs').readFileSync('config.json', 'utf8')); console.log('✅ config.json is valid')"
	@echo "Checking package.json..."
	@node -e "JSON.parse(require('fs').readFileSync('package.json', 'utf8')); console.log('✅ package.json is valid')"
	@echo "✅ All configuration files are valid"

# Run all checks
test: validate build
	@echo "✅ All checks passed!"

# First-time setup
setup: install validate
	@echo ""
	@echo "✅ Setup complete!"
	@echo ""
	@echo "Next steps:"
	@echo "  make build    - Build the tech radar"
	@echo "  make serve    - Run locally at http://localhost:3000"
	@echo "  make help     - Show all available commands"
