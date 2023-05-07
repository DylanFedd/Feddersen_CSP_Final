<template>
    <div>
        <form>
            <fieldset>
                <legend>Sign Up</legend>
                <label>First Name : <input type="text" v-model="signUpForm.fname"></label>
                <label>Last Name : <input type="text" v-model="signUpForm.lname"></label>
                <label>Email: <input type="text" v-model="signUpForm.email"></label>
                <label>Password: <input type="password" v-model="signUpForm.password"></label>
                <button v-on:click.prevent="signUp()">Sign Up</button>
            </fieldset>
        </form>
    </div>
</template>

<script>
import store from "@/store/index.js";

export default {
    data: function() {
        return {
            signUpForm: {
                fname: "",
                lname: "",
                email: "",
                password: ""
            }
        }
    },
    methods: {
        signUp: function() {
            const formdata = new FormData();
            var vm = this;

            formdata.append("fname", this.signUpForm.fname);
            formdata.append("lname", this.signUpForm.lname);
            formdata.append("email", this.signUpForm.email);
            formdata.append("password", this.signUpForm.password);

            fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/addUser.php", {
                method : "post",
                body: formdata
            })
            .then(response => response.json())
            .then(function(data){
                if(data.status == "success") {
                    store.commit("setAuth",{
                        auth: data.auth,
                        session: data.session
                    });

                    store.commit("setUser",{
                        fname: data.fname,
                        lname: data.lname,
                        email: data.email,
                        id: data.id
                    });

                    vm.signUpForm.fname = "";
                    vm.signUpForm.lname = "";
                    vm.signUpForm.email = "";
                    vm.signUpForm.password = "";
                }
                else {
                    console.log(data);
                }
            });
        }
    }
}
</script>

<style>
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