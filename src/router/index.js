import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ItemFormView from '../views/ItemFormView.vue'
import LoginView from '../views/LoginView.vue'
import CollectorListView from '../views/CollectorListView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: "/login",
    name: "login",
    component: LoginView
  },
  {
    path: "/additem",
    name: "additem",
    component: ItemFormView
  },
  {
    path: "/collectorList",
    name: "collectorList",
    component: CollectorListView
  }
]

const router = new VueRouter({
  routes
})

export default router
