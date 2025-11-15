# Contributing to Symfony Vue Starter

Thank you for your interest in contributing to this project!

## How to Contribute

1. **Fork the repository**
   ```bash
   git clone https://github.com/pliszkaPL/symfony-vue-starter.git
   cd symfony-vue-starter
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/my-new-feature
   ```

3. **Make your changes**
   - Follow existing code style
   - Write tests for new features
   - Update documentation as needed

4. **Test your changes**
   ```bash
   make test
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add my new feature"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/my-new-feature
   ```

7. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Describe your changes

## Testing Requirements

All pull requests must pass:
- ✅ Unit tests (PEST)
- ✅ Integration tests (PEST)
- ✅ Acceptance tests (PEST)
- ✅ Behavior tests (Behat)
- ✅ E2E tests (Playwright)

## Code Style

### PHP (Backend)
- Follow PSR-12 coding standards
- Use type declarations
- Write PHPDoc comments for public methods

### JavaScript (Frontend)
- Use ES6+ syntax
- Follow Vue 3 composition API patterns
- Write clear, descriptive variable names

## Documentation

When adding new features:
- Update README.md if needed
- Add comments for complex logic
- Update API documentation

## Questions?

Feel free to open an issue for:
- Bug reports
- Feature requests
- Questions about the codebase

Thank you for contributing! 🎉
