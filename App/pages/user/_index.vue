<template>
  <div class="page-wrapper">
    <div class="container-xl mt-4">
      <div class="card p-4">
        <div class="row row-0">
          <div class="col-auto">
            <span class="avatar avatar-xl"> {{getInitials(user.firstname, user.lastname)}} </span>
          </div>
          <div class="col">
            <div class="card-body">
              <div class="card-title">
                <h2>{{user.firstname}} {{user.lastname}}</h2>
                <h3 class="text-muted">@{{user.username}}</h3>
              </div>

              <div class="d-flex align-items-center">
                <p class="me-4"><strong>{{followed.length}}</strong> Followed</p>
                <p><strong>{{following.length}}</strong> Following</p>
              </div>
            </div>
            <hr>
            <div class="card-body">
              <h3 class="card-title">Last Tweets</h3>

              <div v-for="tweet in tweets" :key="tweet.id" class="card mb-3">
              <Tweet :content="tweet" @refresh="fetch" />
          </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script setup>
import { useFetch, useContext, useRoute, ref } from '@nuxtjs/composition-api'
import { getInitials } from '../../helpers/getInitals';
import { orderByCreationDate } from '../../helpers/orderByDates';

import moment from 'moment';

const {$axios, $auth} = useContext()
const loggedUser = $auth.$state.user

const user = ref("");
const tweets = ref("");
const followed = ref("")
const following = ref("")

const router = useRoute()

const { fetch, fetchState } = useFetch(async () => {
  const {user:userResponse, tweets:tweetsResponse, followed:followedResponse, following:followingResponse} = (await $axios.$get(`/users/${router.value.params.index}`))[0]
  user.value = userResponse
  tweets.value = tweetsResponse.sort(orderByCreationDate)
  followed.value = followedResponse
  following.value = followingResponse
  console.log(user)
})


</script>
