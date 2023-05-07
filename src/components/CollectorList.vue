<template>
    <div>
        <slot></slot>
        <table v-if="this.auth">
            <tr>
                <th>ItemBrand</th>
                <th>Item Name</th>
                <th>Collected</th>
            </tr>
            <tr v-for="(row, index) in collectorlist" v-bind:key="row.CollectorItemID">
                <td>{{ row.ItemBrand}}</td>
                <td>{{ row.ItemName }}</td>
                <td>
                    <input type="checkbox" :checked="row.ItemCollected === '1'" v-on:change="updateItem(row.CollectorItemID, $event)">
                </td>
                <td>
                    <button type="removeItem" v-on:click.prevent="removeItem(row.CollectorItemID,index)">Remove Item</button>
                </td>
            </tr>
        </table>
        <h1 v-else>Please Login First</h1>
    </div>
</template>

<script>
import store from "@/store/index.js";

export default {
    name: "view-collectorlist",
    data: function() {
        return {
            collectorlist: [],
        }
    },
    created: function() {
        this.getCollectorList();
    },
    computed: {
        session: function() {
            return store.state.session;
        },
        auth: function() {
            return store.state.auth;
        }
    },
    methods: {
        getCollectorList: async function() {
            const body = {
                    session: this.session
            };
            const response = await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/getCollectorList.php", {
                method:"post",
                body:JSON.stringify(body),
                header: {"content-type": "application/json" }
            })
            const data = await response.json();
            if(data.status === "success") {
                this.collectorlist = data.collectorlist;
            }
        },
        updateItem: function(collectorItemID, event) {
            const body = {
                CollectorItemID: collectorItemID,
                ItemCollected: event.target.checked
            };

            fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/updateItemCollected.php", {
                method:"post",
                body:JSON.stringify(body),
                header: {"content-type": "application/json" }
            })
        },
        removeItem: async function(collectorItemID,index) {
            const body = {
                CollectorItemID: collectorItemID,
            };

            const response = await fetch("http://localhost/Client-SideProgramming/CSPFinal/CollectorProgram/src/php/removeListItem.php", {
                method:"post",
                body:JSON.stringify(body),
                header: {"content-type": "application/json" }
            })

            const data = await response.json()
            if(data.status === "success") {
                this.collectorlist = [...this.collectorlist.slice(0, index), ...this.collectorlist.slice(index + 1)];
            }
        }
    }
}
</script>

<style scoped>
table {
    text-align: center;
    width: 50%;
    margin: auto;
    background-color: white;
    border: solid;
}

th, td {
    border-bottom: 1px solid #ddd;
}
</style>