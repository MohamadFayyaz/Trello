<template>
<div id="app" class="container py-2">
    <a 
        @click="showModal()"
        class="btn btn-sm btn-outline-primary px-4" 
        style="text-align:right; float:right;">
            Add Board
    </a>
    <div class="modal fade" id="modalBoard" tabindex="-1" aria-labelledby="modalBoard" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Add New Board</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form @submit.prevent="store">
                    <div class="modal-body">
                        <div class="form-group mb-3">
                            <input type="text" v-model="formBoard.name" class="mt-2 form-control"
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
            <div v-for="(board, index) in boards" :key="index" class="col-md-3 my-2">
                <div class="card bg-secondary text-light" style="width: 18rem;">
                    <div class="card-body">
                        <h5 @click="edit(board)" v-if="!data.editId || data.editId != board.id" class="card-title">{{ board.name }}</h5>
                        
                        <input type="text" v-model="data.editBoard" v-if="data.editId == board.id" class="form-control">
                        <div class="my-2" v-if="data.editId == board.id">
                            <button class="btn btn-primary me-2" @click.prevent="updateBoard()">Update</button>
                            <button class="btn btn-primary" @click="cancelEdit()">Cancel</button>
                        </div>
                        <hr>
                        <router-link :to="{name: 'board.index', params:{board_id: board.id }}" href="" class="btn btn-primary card-link me-3">View</router-link>
                        <button @click.prevent="deleteBoard(board.id, index)" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import { reactive, onMounted, ref } from 'vue'
// import Modal from "@/components/views/dashboard/Modal"
// import { useRouter } from 'vue-router'
import axios from 'axios'
import { Modal } from 'bootstrap'

export default{

    setup(){
        const token = localStorage.getItem('token')
        // const router = useRouter()
    
        let data = reactive({
        editBoard: '',
        editId: null,
        myModal: null
        })

        // Mengambil Data dari Form
        const formBoard = reactive({

            name: '',
        })

        // Untuk Menampung Data dari API
        const boards = ref([])

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

        function deleteBoard(id, index){
            axios.delete(`http://127.0.0.1:8000/api/boards/${id}`)
            .then(() => {
                boards.value.splice(index, 1)
            }).catch((err) => {
                console.log(err.response.data);
            });
        }

        function edit(board){
            data.editId = board.id
            data.editBoard = board.name
            console.log(data.editId);
        }

        async function updateBoard(){
            let name = data.editBoard
            let id = data.editId
            await axios.put(`http://127.0.0.1:8000/api/boards/${id}`,{
                name,
            }).then(() => {
                data.editId = null
                data.editBoard = ''
                getAllData()
                console.log(boards);
            }).catch((err) => {
                console.log(err);
            });
        }

        function cancelEdit(){
            data.editId = null
            data.editBoard = ''
        }

        
        async function getAllData(){
            axios.defaults.headers.common.Authorization = `Bearer ${token}`
            await axios.get('http://127.0.0.1:8000/api/boards')
            .then(response => {
                    console.log(response);
                    boards.value = response.data.data
            }).catch((err) => {
                console.log(err.response.data);
            });
        }

        async function store(){
            let name = formBoard.name
            await axios.post('http://127.0.0.1:8000/api/boards',{
                name,
            }).then(() => {
                formBoard.name = '';
                this.myModal.hide()
                getAllData()
                console.log(boards);
            }).catch((err) => {
                console.log(err);
            });
            
        }


        // onMounted Properti
        onMounted( getAllData() )


        
        return{
            token,
            showModal,
            deleteBoard,
            formBoard,
            data,
            edit,
            updateBoard,
            cancelEdit,
            validation,
            boards,
            store,
        }
        
    }
    
}
</script>