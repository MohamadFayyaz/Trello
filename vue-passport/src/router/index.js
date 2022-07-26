import { createRouter, createWebHistory } from 'vue-router'
// import { reactive } from 'vue'

const routes = [
    {
        path:'/login',
        name:'login',
        component: () => import('../components/views/auth/Login.vue' ),
    },
    {
        path:'/register',
        name:'register',
        component: () => import('../components/views/auth/Register.vue' )
    },
    {
        path:'/',
        name:'dashboard',
        component: () => import('../components/views/dashboard/Index.vue' )
    },
    {
        path:'/board/:board_id',
        name:'board.index',
        component: () => import('../components/views/board/Index.vue' ),
    },
];


// const openRoutes = ['/'];

const router = createRouter({
    history: createWebHistory(),
    routes,
})

// const isToken = localStorage.getItem('token')

router.beforeResolve((to, from, next) => {
    if (to.name !== 'login' && localStorage.getItem('token') == null) {
        next('/login');
        console.log(to.name !== 'login');
        console.log(localStorage.getItem('token') !== null);
        // console.log(token);
        console.log(to);
        console.log(from);
    }else if(to.name == 'login' && localStorage.getItem('token') !== null){
        next(false)
    }else{
        next()
    }

})


    // console.log(next);


export default router