<template>
    <div>
        <form id="newcollectorForm">
        <fieldset v-bind:class="{validStyle: collectorForm.valid == true, invalidStyle: collectorForm.invalid}">
            <legend>Add Item To List</legend>
            <label>
                Select Item:
                <select v-model="collectorForm.itemID">
                    <option v-for="(item,index) in items" :key="index" :value="item.ItemID">{{item.ItemName}}</option>
                </select>
            </label>

        </fieldset>
        <button type="submit" v-on:click.prevent="addItem()">submit</button>
        </form>
    </div>
</template>

<script>
    import store from "@/store/index.js";

    export default {
        name: "add-item",
        data: function() {
            return {
                collectorForm: {
                    collectorItemID: null,
                    itemID: null,
                    itemcollected: false,
                    valid: false,
                    invalid: true
                },
                items: []
            }
        },

        created: async function() {
            await this.getItems();

        },
        computed: {

            session: function() {
                return store.state.session;
            }

        },
        methods: {

            addItem: async function() {                
                const body = {
                    session: this.session, 
                    ...this.collectorForm
                };
                const response = await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/AddItem.php", {
                    method:"post",
                    body:JSON.stringify(body),
                    header: {"content-type": "application/json" }
                });
                const data = await response.json();
                if(data.status === "success"){
                    this.$router.push("/collectorList");
                }

            },

            getItems: async function() {
                const response = await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/getItems.php");
                const data = await response.json();
                this.items = data.items;
            }

        },
        watch: {

            collectorForm: {
                handler: function() {
                    if(this.collectorForm.firstName == "") {
                        this.collectorForm.valid = false;
                        this.collectorForm.invalid = true;
                    }
                    else {
                        this.collectorForm.valid = true;
                        this.collectorForm.invalid = false;
                    }
                },
                deep: true
            },

        }
    }
</script>

<style scoped>
</style>