<template>
  <div id="app">
    <header>
      <h1>Collector Website</h1>
    </header>
    <nav>
      | <router-link to="/"> Home </router-link>|
      <router-link to="/login">Login</router-link>|
      <span v-if="auth"><router-link to="/additem"> Add Item </router-link>|</span>
      <span v-if="auth"><router-link to="/collectorList"> Collector List</router-link>|</span>
      <!-- <router-link to="/collectorList">Collector List</router-link> -->
    </nav>
    <router-view/>
  </div>
</template>

<script>
import store from "@/store/index.js"

  export default {
    computed: {
      auth: function() {
        return store.state.auth;
      }
    }
  }
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

html {
  background-color: tan;
  padding: 3%;
}

#app {
  /* background-color: green; */
  background-color: rgba(111, 108, 108, 0.4);
  margin: 20px;
  height: 1000px;
}

header {
  padding-top: 5px;
  font-weight: bold;
  text-decoration: underline;
}

nav {
  padding-top: 10px;
  padding-bottom: 10px;
  background-color: rgba(108, 64, 13);
  padding-left: 50px;
  padding-right: 10%;
  border: solid 1px black;
}

nav a {
  font-weight: bold;
  color: white;
}

nav a.router-link-exact-active {
  color: orange;
}
</style>
