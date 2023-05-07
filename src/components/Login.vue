<template>
    <div>
        <slot></slot>
        <form v-if="!this.auth">
            <fieldset>
                <legend>{{ legend }}</legend>
                <label>Email: <input type="text" v-model="email"></label>
                <label>Password: <input type="password" v-model="password"></label>
                <button v-on:click.prevent="login()">Login</button>
            </fieldset>
        </form>
        <form v-else>
            <button v-on:click.prevent="logout()">Logout</button>
            <p>Rest Password</p>
            <label>Old Password: <input type="password" v-model="password"></label>
            <label>New Password: <input type="password" v-model="newPassword"></label>
            <button v-on:click.prevent="changePassword()">Change Password</button>
        </form>
    </div>
</template>

<script>
import store from "@/store/index.js";

export default {
    name: "login-form",
    props: {
        legend: {
            type: String,
            default: "Login"
        }
    },
    data: function() {
        return {
            email: "",
            password: "",
            newPassword: ""
        };
    },
    computed: {
        auth: function() {
            return store.state.auth;
        }
    },
    methods: {
        login: function() {
            const formdata = new FormData();
            var vm = this;

            formdata.append("email",this.email);
            formdata.append("password", this.password);

            fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/login.php", {
                method: "post",
                body: formdata
            })
            .then(response => response.json())
            .then(function(data){
                if(data.status == "success") {
                    vm.email = "";
                    vm.password = "";

                    store.commit("setAuth", {
                        auth: data.auth,
                        session: data.session
                    });
                    store.commit("setUser", {
                        fname: data.fname,
                        lname: data.lname,
                        email: data.email,
                        id: data.id
                    });
                }
                else {
                    console.log(data);
                }
            });
        },
        logout: async function() {
            const body = {
                sessionID: store.state.session
            };
            await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/signOut.php", {
                method:"post",
                body:JSON.stringify(body),
                header: {"content-type": "application/json" }
            })

            store.state.auth = false;
            store.state.username = "";
            store.state.session = "";
        },
        changePassword: async function() {
            const body = {
                oldPassword: this.password,
                newPassword: this.newPassword,
                sessionID: store.state.session
            };
            await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/changePassword.php", {
                method:"post",
                body:JSON.stringify(body),
                header: {"content-type": "application/json" }
            })

            this.password = ""
            this.newPassword = ""
        }
    }
}
</script>

<style scoped>
    fieldset {
        background-color: gray;
        border: 1px solid orange;
        width: 50%;
        margin-left: auto;
        margin-right: auto;
    }
    legend{
        background-color: tan;
        color: white;
        padding: 5px;
        border: solid 1px orange;
    }
    label{
        display: block;
        margin-bottom: 10px;
        color: white;
    }
    button{
        color: black;
        background-color: grey;
    }
</style>