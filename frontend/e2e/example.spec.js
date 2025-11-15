import { test, expect } from '@playwright/test';

test('homepage has correct title', async ({ page }) => {
  await page.goto('/');
  
  await expect(page.locator('h1')).toContainText('Symfony 7.3 + Vue 3 Starter');
});

test('homepage shows welcome message', async ({ page }) => {
  await page.goto('/');
  
  await expect(page.locator('p')).toContainText('Welcome to your Symfony + Vue.js boilerplate!');
});
