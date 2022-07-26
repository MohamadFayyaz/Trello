<template>
        <!-- Modal -->
        <div class="modal fade" id="modalBoard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Board</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                            <form @submit.prevent="store">
                                <div class="form-group">
                                    <input type="text" v-model="formBoard.name" class="mt-2 form-control"
                                        placeholder="Enter Your Board Name">
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-block mt-2">Save</button>
                            </form>
                    </div>
                </div>
            </div>
        </div>
</template>

<script>
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

export default{

    setup(){
        const router = useRouter()

        // Mengambil Data dari Form
        const formBoard = reactive({
            name: '',
        })

        // State Validation Form
        const validation = ref([])
        
        async function store(){
            let name = formBoard.name

            await axios.post('http://127.0.0.1:8000/api/boards',{
                name,
            }).then(() => {
                formBoard.name.value = '';
                router.push({
                    name: 'dashboard'
                })
            }).catch((err) => {
                console.log(err.response.data);
            });
            
        }

        return{
            formBoard,
            validation,
            store,
        }
        
    }
    
}
</script>