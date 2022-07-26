<template>
<div id="app" class="container py-2">
    <a 
        @click="showModal()"
        class="btn btn-sm btn-outline-primary px-4" 
        style="text-align:right; float:right;">
            Add
    </a>
    <div class="modal fade" id="modalBoard" tabindex="-1" aria-labelledby="modalBoard" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Utente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form @submit.prevent="store">
                    <div class="modal-body">
                        <div class="form-group mb-3">
                            <input type="text" v-model="boardList.name" class="mt-2 form-control"
                            placeholder="Enter Your Board Name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-sm btn-outline-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3 my-2">
                <ul class="list-group">
                    <li class="list-group-item active text-center">Todo</li>
                    <li class="list-group-item">A second item</li>
                    <li class="list-group-item">A third item</li>
                    <li class="list-group-item">A fourth item</li>
                    <li class="list-group-item text-center text-small fw-bold">+ New Cards</li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
import { reactive, onMounted, ref } from 'vue'
// import Modal from "@/components/views/dashboard/Modal"
// import { useRouter } from 'vue-router'
import axios from 'axios'
import { useRoute } from 'vue-router'
import { Modal } from 'bootstrap'

export default{

    setup(){
        const token = localStorage.getItem('token')

        // const router = useRouter()

        let data = reactive({
        myModal: null
        })

        // Mengambil Data dari Form
        const boardList = reactive({
            name: '',
        })

        // untuk Menangakap param dari index.dashboard
        const route = useRoute()
        
        // Untuk Menampung Data dari API
        const lists = ref([])

        // State Validation Form
        const validation = ref([])

        function showModal(){
            try{
                this.myModal = new Modal(document.getElementById('modalBoard'), {})
                this.myModal.show()
            }catch(e){
                console.log(e);
            }

        }

        async function getList(){

            axios.defaults.headers.common.Authorization = `Bearer ${token}`
            await axios.get(`http://127.0.0.1:8000/api/boards/${route.params.board_id}}`)
            .then(response => {

                lists.value = response.data
                
            }).catch((err) => {
                console.log(err.response.data);
            });
        }

        async function store(){
            let name = boardList.name
            await axios.post('http://127.0.0.1:8000/api/lists',{
                name,
            }).then(() => {
                boardList.name = '';
                this.myModal.hide()
                getList()
            }).catch((err) => {
                console.log(err);
            });
            
        }

        // onMounted Properti
        onMounted(getList())

        return{
            token,
            getList,
            showModal,
            lists,
            boardList,
            data,
            validation,
            store,
        }
        
    }
    
}
</script>