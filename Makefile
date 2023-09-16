# Define the directories for the frontend and backend
FRONTEND_DIR = apps/frontend
BACKEND_DIR = apps/backend

# Define the commands for running the frontend and backend
FRONTEND_COMMAND = ng serve
BACKEND_COMMAND = go run main.go
PACKAGE_INSTALL = pnpm install

# Targets to run the frontend and backend
install_packages:
	@echo "Installing Packages for frontend..."
	cd $(FRONTEND_DIR) && $(PACKAGE_INSTALL)

run_frontend: 
	@echo "Running Angular frontend..."
	cd $(FRONTEND_DIR) && $(FRONTEND_COMMAND)


run_backend:
	@echo "Running Go backend..."
	cd $(BACKEND_DIR) && sudo docker compose build && sudo docker compose up

build:
	@go build -o bin/books

run: build
	@./bin/books
