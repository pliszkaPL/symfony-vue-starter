# Symfony 7.3 + API Platform + Vue 3 Starter

A complete monorepo boilerplate for modern web applications with Symfony backend and Vue.js frontend, ready for development and production deployment with Docker.

## 🚀 Features

### Backend
- **Symfony 7.3** - Latest PHP framework
- **API Platform 4** - REST and GraphQL API
- **MySQL 8.0** - Database
- **PEST** - Modern testing framework (unit, integration, acceptance)
- **Behat** - Behavior-driven development
- **Sentry** - Error tracking and monitoring

### Frontend
- **Vue 3** - Progressive JavaScript framework
- **Vite** - Fast build tool and dev server
- **Playwright** - End-to-end testing

### Infrastructure
- **Docker Compose** - Development and production environments
- **Traefik** - Reverse proxy with automatic HTTPS (Let's Encrypt)
- **Self-hosted Sentry** - Error tracking
- **Makefile** - Simple command interface

### CI/CD
- **GitHub Actions** - Automated workflows
  - Smoke + unit tests on branch push
  - Full test suite on pull requests
  - Manual deployment with confirmation

## 📋 Requirements

- Docker & Docker Compose
- Make
- Git

For local development without Docker:
- PHP 8.3+
- Node.js 20+
- Composer
- npm

## 🏗️ Project Structure

```
.
├── backend/                 # Symfony application
│   ├── src/                # Application source code
│   ├── tests/              # Tests (PEST, Behat)
│   │   ├── Unit/          # Unit tests
│   │   ├── Integration/   # Integration tests
│   │   └── Acceptance/    # Acceptance tests
│   ├── features/          # Behat features
│   └── composer.json      # PHP dependencies
│
├── frontend/               # Vue.js application
│   ├── src/               # Application source code
│   ├── e2e/               # Playwright tests
│   └── package.json       # Node dependencies
│
├── docker/                # Docker configurations
│   ├── dev/              # Development environment
│   │   ├── docker-compose.yml
│   │   ├── Dockerfile.backend
│   │   └── Dockerfile.frontend
│   └── prod/             # Production environment
│       ├── docker-compose.yml
│       ├── Dockerfile.backend
│       ├── Dockerfile.frontend
│       └── nginx configs
│
├── .github/
│   └── workflows/        # GitHub Actions
│       ├── smoke-unit-tests.yml
│       ├── pr-tests.yml
│       └── deploy.yml
│
├── Makefile              # Command shortcuts
└── README.md
```

## 🚦 Quick Start

### Development Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/pliszkaPL/symfony-vue-starter.git
   cd symfony-vue-starter
   ```

2. **Build and start the development environment**
   ```bash
   make build-dev
   make up-dev
   ```

3. **Access the applications**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - Sentry: http://localhost:9000

### Production Environment

1. **Configure environment variables**
   ```bash
   cp docker/prod/.env.prod.example docker/prod/.env.prod
   # Edit .env.prod with your production settings
   ```

2. **Deploy**
   ```bash
   make build-prod
   make up-prod
   ```

## 🛠️ Available Commands

### Development
```bash
make build-dev        # Build development Docker images
make up-dev          # Start development environment
make down-dev        # Stop development environment
make logs            # View container logs
```

### Production
```bash
make build-prod      # Build production Docker images
make up-prod         # Start production environment
make down-prod       # Stop production environment
```

### Testing
```bash
make test            # Run all tests
make test-unit       # Run PHP unit tests (PEST)
make test-integration # Run integration tests (PEST)
make test-acceptance  # Run acceptance tests (PEST)
make test-behat      # Run behavior tests (Behat)
make test-e2e        # Run e2e tests (Playwright)
```

### Deployment
```bash
make deploy          # Deploy to production (with confirmation)
```

### Utilities
```bash
make clean           # Clean up containers, volumes, and cache
```

## 🧪 Testing

### Backend Tests (PHP)

#### PEST Tests
The project uses PEST for modern PHP testing:

```bash
# Run all PEST tests
cd backend && ./vendor/bin/pest

# Run specific test groups
./vendor/bin/pest --group=unit
./vendor/bin/pest --group=integration
./vendor/bin/pest --group=acceptance

# Run specific test file
./vendor/bin/pest tests/Unit/ExampleTest.php
```

#### Behat Tests
Behavior-driven development with Behat:

```bash
cd backend && ./vendor/bin/behat
```

### Frontend Tests (JavaScript)

#### Playwright E2E Tests
```bash
cd frontend && npm run test:e2e
```

## 🔧 Configuration

### Backend Configuration

Edit `backend/.env` for local development settings:
```env
DATABASE_URL=mysql://symfony:symfony@mysql:3306/symfony_app?serverVersion=8.0
APP_ENV=dev
SENTRY_DSN=http://sentry-key@localhost:9000/1
```

### Frontend Configuration

Edit `frontend/vite.config.js` for Vite settings.

Environment variables can be set in `.env` files:
```env
VITE_API_URL=http://localhost:8000
```

### Production Configuration

For production deployment, copy and configure:
```bash
cp docker/prod/.env.prod.example docker/prod/.env.prod
```

Required variables:
- `DOMAIN` - Your domain name
- `MYSQL_ROOT_PASSWORD` - MySQL root password
- `MYSQL_PASSWORD` - MySQL user password
- `SENTRY_DSN` - Sentry DSN for error tracking
- `SENTRY_SECRET_KEY` - Sentry secret key
- `SENTRY_DB_PASSWORD` - Sentry database password

## 🚢 Deployment

### GitHub Actions

The project includes three workflows:

1. **Smoke + Unit Tests** (`smoke-unit-tests.yml`)
   - Triggered on every push to main, develop, or feature branches
   - Runs unit tests and builds the frontend

2. **Full Test Suite** (`pr-tests.yml`)
   - Triggered on pull requests
   - Runs all tests: unit, integration, acceptance, behat, and e2e

3. **Deploy to Production** (`deploy.yml`)
   - Manual trigger via GitHub Actions UI
   - Requires typing "deploy" to confirm
   - Deploys via SSH to production server

### Manual Deployment

1. Set up required GitHub secrets:
   - `SSH_PRIVATE_KEY` - SSH key for server access
   - `SERVER_HOST` - Production server hostname
   - `SERVER_USER` - SSH username
   - `DEPLOY_PATH` - Path to application on server
   - `DOMAIN` - Your domain name

2. Go to Actions > Deploy to Production
3. Click "Run workflow"
4. Type "deploy" in the confirmation field
5. Click "Run workflow" button

## 🔒 Security

### Sentry Integration

The project includes self-hosted Sentry for error tracking:

1. Access Sentry at http://localhost:9000 (dev) or https://sentry.yourdomain.com (prod)
2. Create a project and get the DSN
3. Update the `SENTRY_DSN` in your environment configuration

### SSL/TLS with Traefik

Production environment uses Traefik with automatic Let's Encrypt certificates:

- Automatic HTTPS for all services
- HTTP to HTTPS redirection
- Certificate renewal

Configure your domain in `docker/prod/.env.prod`:
```env
DOMAIN=yourdomain.com
```

## 📚 Documentation

### Symfony
- [Symfony Documentation](https://symfony.com/doc/current/index.html)
- [API Platform Documentation](https://api-platform.com/docs/)

### Vue.js
- [Vue 3 Documentation](https://vuejs.org/)
- [Vite Documentation](https://vitejs.dev/)

### Testing
- [PEST Documentation](https://pestphp.com/)
- [Behat Documentation](https://docs.behat.org/)
- [Playwright Documentation](https://playwright.dev/)

### Infrastructure
- [Docker Documentation](https://docs.docker.com/)
- [Traefik Documentation](https://doc.traefik.io/traefik/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Write/update tests
5. Submit a pull request

All pull requests must pass the full test suite.

## 📝 License

This project is open source and available under the [ISC License](LICENSE).

## 🎯 Next Steps

This is a boilerplate project with no application logic. To start building your application:

1. **Backend**:
   - Create API resources in `backend/src/ApiResource/`
   - Add entities in `backend/src/Entity/`
   - Write tests for your business logic

2. **Frontend**:
   - Create Vue components in `frontend/src/components/`
   - Add views/pages as needed
   - Connect to the API

3. **Deploy**:
   - Configure production environment
   - Set up GitHub secrets
   - Deploy via GitHub Actions

Happy coding! 🚀
