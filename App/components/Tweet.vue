<template>
<div>
    <div class="card-body">
    <div class="card-title d-flex align-items-center justify-content-between">
      <div class="d-flex align-items-center">
        <span class="avatar">{{
        getInitials(content.user.firstname, content.user.lastname)
      }}</span>
      <div class="ms-2">
        <h3>{{ content.user.firstname }} {{ content.user.lastname }}</h3>
        <nuxt-link :to="`/user/${content.user.id}`">
        <h4 class="text-muted">@{{ content.user.username }}</h4>
        </nuxt-link>
      </div>
      </div>
      <button v-if="isFollowing()" class="btn" @click.prevent="followUser(content.user.id)">
        S'abonner
      </button>
      <button v-else class="btn btn-info" @click.prevent="followUser(content.user.id)">
        Abonné
      </button>
    </div>

    <p class="text-muted">
      <components :is="contentToDisplay" />
      <div v-if="content.is_retweet" class="card">
        <Tweet :content="content.retweet_original_tweet" isRetweet/>
      </div>
    </p>
  </div>
  <div class="card-footer d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center" v-if="!isRetweet">
      <button
        class="btn me-2"
        @click.prevent="sendLike(content.id)"
        :class="{
          'btn-info': content.likes.find((like) => like.user_id == loggedUser.id),
        }"
      >
        <Like /> Like
      </button>
      <div>{{ content.likes.length }} likes</div>
    </div>
    <div>
      <button class="btn" @click.prevent="sendRetweet">Retweet</button>
    </div>
    <div>{{ moment(content.created_at).fromNow() }}</div>
  </div>
</div>

</template>

<script setup>
import { defineProps, defineEmits, useContext, } from '@nuxtjs/composition-api'
import moment from 'moment';
import { getInitials } from '../helpers/getInitals';
import {useEnrichContent} from "../helpers/enrichText"

const props = defineProps({
  content: Object,
  isRetweet: Boolean
})

const emit = defineEmits(['refresh'])

const {$auth, $axios} = useContext()

const loggedUser = $auth.$state.user
const contentToDisplay = useEnrichContent(props.content.content)

  const sendLike = async (tweetId) => {
      await $axios.$post("/likes", {
        user_id: $auth.$state.user.id,
        tweet_id: tweetId
      })

      emit('refresh')
    }

  const sendRetweet = async () => {
    await $axios.$post("/tweets", {
      user_id: loggedUser.id,
      is_retweet: true,
      retweet_original_id: props.content.id
    })

    emit("refresh")
  }

  const isFollowing = () => {
   return !loggedUser.following.some(follow => follow.followed_id === props.content.user.id)
  }


  const followUser = async (followedId) => {
    await $axios.$post("/follows", {
        followed_id: followedId,
        following_id: loggedUser.id
    })

    emit("refresh")
  }

</script>
