<template>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Project Management</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
         <li class="nav-item">
          <router-link :to="{name: 'dashboard'}" class="nav-link" href="">HOME</router-link>
        </li>
        <li class="nav-item">
          <router-link :to="{name: 'register'}" class="nav-link" href="">REGISTER</router-link>
        </li>
        <li class="nav-item">
          <router-link :to="{name: 'login'}" class="nav-link" href="#">LOGIN</router-link>
        </li>
        <li @click.prevent="logout" class="nav-link" style="cursor:pointer">LOGOUT</li>
      </ul>
    </div>
  </div>
</nav>
  <router-view/>
</template>

<script>

// import { ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'
// import { onMounted } from 'vue'

export default{

    setup(){
        const token = localStorage.getItem('token')

        const router = useRouter()

        function logout(){
            // logout
            // console.log(axios.defaults.headers.common.Authorization);
            // console.log(token);
            // axios.defaults.headers.common.Authorization = `Bearer ${token}`;
            axios.post('http://127.0.0.1:8000/api/logout')
            .then(response => {
                if(response.data.success){

                    localStorage.removeItem('token')

                    return router.push({
                        name: 'login'
                    })
                    
                }
            }).catch(err => {
                console.log(err.response.data);
            });
        }

        return{
            token,
            logout
        }
        
    }
    
}
</script>

<style>
  body {
    background: lightgray!important;
  }
</style>