<template>
  <div class="page-wrapper">
    <div class="container-xl">
      <h1>Fil d'actualité</h1>
    </div>

    <div class="page-body">
      <div class="container-xl">
        <ul>
          <li v-for="example in examples" :key="example.id">
            {{ example.name }}
          </li>
        </ul>

        <div class="mb-4">
          <textarea
            class="form-control mb-2"
            name="example-textarea-input"
            rows="6"
            placeholder="Racontez quelque chose !"
            ref="tweetContent"
          ></textarea>
          <div class="d-flex justify-content-end">
            <button class="btn btn-primary" @click.prevent="sendTweet">Postez !</button>
          </div>
        </div>

        <div class="mb-3">
          <div v-for="tweet in tweets" :key="tweet.id" class="card mb-3">
            <div class="card-body">
              <h3 class="card-title">{{tweet.user.email}}</h3>
              <p class="text-muted">
                {{tweet.content}}
              </p>
            </div>
            <div class="card-footer">This is standard card footer</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useContext, useFetch, ref } from "@nuxtjs/composition-api";

export default {
  setup() {
    const { $axios, $auth } = useContext();

    const examples = ref("");
    const tweets = ref("");
    const tweetContent = ref("")

    const { fetch, fetchState } = useFetch(async () => {
      examples.value = await $axios.$get("/examples");
      tweets.value = await $axios.$get("/tweets");
    });

    const sendTweet = async () => {
      const data = {
        content: tweetContent.value.value,
        user_id: $auth.$state.user.id
      }

      await $axios.$post("/tweets", data)

      fetch()
    }

    return { examples, tweets, tweetContent, sendTweet };
  },
};
</script>
