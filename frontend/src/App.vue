<template>
  <div id="app">
    <header>
      <h1>Symfony 7.3 + Vue 3 Starter</h1>
    </header>
    <main>
      <p>Welcome to your Symfony + Vue.js boilerplate!</p>
      <p>This is a monorepo setup with:</p>
      <ul>
        <li>Symfony 7.3 with API Platform</li>
        <li>Vue 3 with Vite</li>
        <li>Docker Compose for dev and prod</li>
        <li>Traefik with Let's Encrypt</li>
        <li>MySQL database</li>
        <li>Self-hosted Sentry</li>
      </ul>
    </main>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

header h1 {
  color: #42b983;
}

ul {
  list-style-position: inside;
}
</style>
