<template>
  <div class="home">
    <HelloWorld msg="Welcome to The Collector Program"/>
    <p>this program will allow you to.</p>
    <p>- create a user</p>
    <p>- add/remove items from the collector list</p>
    <p>- able to  confirm you have the item</p>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'HomeView',
  components: {
    HelloWorld
  }
}
</script>
