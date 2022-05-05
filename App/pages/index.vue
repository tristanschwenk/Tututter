<template>
  <div class="page-wrapper">
    <div class="container-xl mt-4">
      <h1>Feed</h1>
    </div>

    <div class="page-body">
      <div class="container-xl">
        <div class="mb-4">
          <textarea
            class="form-control mb-2"
            name="example-textarea-input"
            rows="6"
            placeholder="Racontez quelque chose !"
            ref="tweetContent"
          ></textarea>
          <div class="d-flex justify-content-end">
            <button class="btn btn-primary" @click.prevent="sendTweet">Post !</button>
          </div>
        </div>

        <div class="mb-3">
          <div v-for="tweet in tweets" :key="tweet.id" class="card mb-3">
            <Tweet :content="tweet"  @refresh="fetch"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .card-title {
    h3 {
      margin: 0;
      text-transform: capitalize;
    }

    h4.text-muted {
        font-weight: 400;

      }
  }
</style>

<script setup>
import { useContext, useFetch, ref } from "@nuxtjs/composition-api";
import { getInitials } from "../helpers/getInitals";
import { orderByCreationDate } from "../helpers/orderByDates";
import moment from "moment"

    const { $axios, $auth } = useContext();
    const loggedUser = $auth.$state.user


    const tweets = ref("");
    const tweetContent = ref("")

    const getInit = (a,b) => {
      return getInitials(a,b)
    }

    const { fetch, fetchState } = useFetch(async () => {
      let response = await $axios.$get("/tweets");

      tweets.value = response.sort(orderByCreationDate)
    });

    const sendTweet = async () => {
      const data = {
        content: tweetContent.value.value,
        user_id: $auth.$state.user.id
      }

      await $axios.$post("/tweets", data)

      fetch()
    }

</script>
