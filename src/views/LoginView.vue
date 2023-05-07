<template>
    <div>
        <login legend="Authentication">
            <authheader/>
        </login>
        <div v-if="!this.auth">
            <h2>- OR -</h2>
            <signup/>
        </div>
    </div>
</template>

<script>
import login from "@/components/Login.vue";
import authheader from "@/components/AuthHeader.vue";
import signup from "@/components/SignUp.vue";
import store from "@/store/index.js";

export default {
    name: "LoginView",
    components: {
        login,
        authheader,
        signup
    },
    computed: {
        auth: function() {
            return store.state.auth;
        }
    }
}
</script>

<style scoped>
    label{
        display: block;
        margin-bottom: 5px;
    }
</style>