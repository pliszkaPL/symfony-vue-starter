# Quick Start Guide

Get your Symfony + Vue development environment running in minutes!

## Prerequisites

- Docker & Docker Compose installed
- Make (usually pre-installed on macOS/Linux)
- Git

## Steps

### 1. Clone the repository

```bash
git clone https://github.com/pliszkaPL/symfony-vue-starter.git
cd symfony-vue-starter
```

### 2. Start development environment

```bash
make build-dev
make up-dev
```

This will:
- Build Docker images for backend and frontend
- Start MySQL database
- Start Symfony backend on port 8000
- Start Vue frontend on port 3000
- Start Sentry on port 9000

### 3. Access your applications

Open your browser:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000/api
- **API Documentation**: http://localhost:8000/api/docs
- **Sentry**: http://localhost:9000

### 4. Run tests

```bash
# Run all tests
make test

# Or run specific test suites
make test-unit
make test-integration
make test-acceptance
make test-behat
make test-e2e
```

### 5. Stop environment

```bash
make down-dev
```

## What's Next?

### Backend Development

1. Create your first API resource:
   ```bash
   cd backend
   php bin/console make:entity --api-resource
   ```

2. Add your business logic in `backend/src/`

3. Write tests in `backend/tests/`

### Frontend Development

1. Create Vue components in `frontend/src/components/`

2. Add pages/views as needed

3. Connect to backend API

4. Write e2e tests in `frontend/e2e/`

## Common Commands

```bash
# View logs
make logs

# Clean everything
make clean

# Production deployment
make deploy
```

## Need Help?

- 📖 Read the [full README](README.md)
- 🐛 Check [Contributing Guide](CONTRIBUTING.md)
- 🔒 Review [Security](SECURITY.md)
- 💬 Open an issue on GitHub

Happy coding! 🎉
