<template>
    <div class="container my-5" >
        <div class="d-flex flex-wrap" >
            <!-- SideBar Info -->
            <div  class="col-12 col-md-4 d-flex justify-content-between flex-column b-color-1 z-index-1 f-color-2 px-4 py-5" style=" min-height: 25em;border-radius: 35px 0px 0px 35px; ">
                <header class="text-center">
                    <img src="@/assets/logo.jpg" alt="waraqa logo" classs="img-fluid" style="width:120px">
                </header>
                <article v-if="loginTab" class="text-center f-color-0">
                    <h4>Don't have account ? </h4>
                    <p class="m-0 px-5">Enter to your account in the Waraqa</p>
                    <button class="soft-button-style mt-3 px-3 py-1" @click="loginTab=false">Sign up</button>
                </article>
                <article v-else class="text-center f-color-0">
                    <h4>Already have an account ?</h4>
                    <p class="m-0 px-5">Enter to your account in the Waraqa</p>
                    <button class="soft-button-style mt-3 px-3 py-1 " @click="loginTab=true">Log In</button>
                </article>

                <footer class="text-center media">
                    <!-- Social Media -->
                    <a class="px-3" href="#"><i class="px-2 fab fa-facebook-f"></i></a>
                    <a class="px-3" href="#"><i class="fab fa-twitter"></i></a>
                    <a class="px-3" href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a class="px-3" href="#"><i class="pr-1 fab fa-instagram"></i></a>
                </footer>
            </div>
            <!-- Form -->
            <div style="border-radius: 0px 35px 35px 0px;" class="col-12 col-md-8 mt-4 mt-md-0 b-color-0 d-flex justify-content-center py-5 px-md-5 box-shadow-style">
                <div class="col-11 col-md-10">
                    <LogIn v-if="loginTab" />
                    <Register v-if="!loginTab" />
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import LogIn from '@/components/auth/LogIn'
import Register from '@/components/auth/Register'
export default {
    components:{
        LogIn,
        Register
    },
    data(){
        return {
            loginTab:true
        }
    },
    methods:{
        authorized(userType){
            // Auth > Index
            this.$parent.setAuthorized(userType);
        }
    }
}
</script>

<style>
.media i{
    color: var(--color-0);
    padding: 5px;
    font-size: 80%;
}
.media i:hover {
    background-color: var(--color-0);
    color: var(--color-1);
    border-radius: 50%; 
}
</style>
