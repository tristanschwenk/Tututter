<template>
    <div class="page page-center">
      <div class="container-tight py-4">
        <div class="text-center mb-4">
          <a href="." class="navbar-brand navbar-brand-autodark"><img src="@/static/logo.svg" height="36" alt=""></a>
        </div>
        <form class="card card-md" @submit.prevent="registerAccount">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Create new account</h2>
            <div class="mb-3">
              <label class="form-label">Firstname</label>
              <input type="text" class="form-control" placeholder="Enter firstname" ref="firstname">
            </div>
            <div class="mb-3">
              <label class="form-label">Lastname</label>
              <input type="text" class="form-control" placeholder="Enter lastname" ref="lastname">
            </div>
            <div class="mb-3">
              <label class="form-label">Username</label>
              <input type="text" class="form-control" placeholder="Enter username" ref="username">
            </div>
            <div class="mb-3">
              <label class="form-label">Email address</label>
              <input type="email" class="form-control" placeholder="Enter email" ref="email">
            </div>
            <div class="mb-3">
              <label class="form-label">Password</label>
              <div class="input-group input-group-flat">
                <input type="password" class="form-control"  placeholder="Password"  autocomplete="off" ref="password">
                <span class="input-group-text">
                  <a href="#" class="link-secondary" title="Show password" data-bs-toggle="tooltip"><!-- Download SVG icon from http://tabler-icons.io/i/eye -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="2" /><path d="M22 12c-2.667 4.667 -6 7 -10 7s-7.333 -2.333 -10 -7c2.667 -4.667 6 -7 10 -7s7.333 2.333 10 7" /></svg>
                  </a>
                </span>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-check">
                <input type="checkbox" class="form-check-input"/>
                <span class="form-check-label">Agree the <a href="./terms-of-service.html" tabindex="-1">terms and policy</a>.</span>
              </label>
            </div>
            <div class="form-footer">
              <button type="submit" class="btn btn-primary w-100">Create new account</button>
            </div>
          </div>
        </form>
        <div class="text-center text-muted mt-3">
          Already have account? <nuxt-link to="/auth/sign-in">Sign in</nuxt-link>
        </div>
      </div>
    </div>

</template>

<script>
export default {
  auth: "guest"
}
</script>

<script setup>
import { defineComponent, useContext, ref, useRouter } from '@nuxtjs/composition-api'

const { $axios, $auth } = useContext()

console.log($auth)

const firstname = $ref("");
const lastname = $ref("");
const username = $ref("");
const email = $ref("");
const password = $ref("");

const router = useRouter()

const registerAccount = async () => {
  console.log(firstname.value)
  const user = {
    firstname: firstname.value,
    lastname: lastname.value,
    username: username.value,
    email: email.value,
    password: password.value
  }

    const newAccount = await $axios.$post("/users/register", {user})
    router.push("/auth/sign-in")
}
</script>
