<template>
     <div>
        <h1>{{ text }}</h1>
        <p v-if="this.auth">{{ username }} is authenticated</p>
        <p v-else>You are not authenticated</p>
    </div>
</template>

<script>
import store from "@/store/index.js";

export default {
    name: "auth-header",
    props: {
        text: {
            type: String,
            default: "Authorization",
            required: false
        }
    },
    computed: {
        auth: function() {
            return store.state.auth;
        },
        username: function() {
            return store.state.user.fname + " " + store.state.user.lname;
        }
    }
}
</script>

<style scoped>
</style>