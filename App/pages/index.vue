<template>
  <div>
    <h1>Hello there</h1>

    <ul>
      <li v-for="example in examples" :key="example.id">{{example.name}}</li>
    </ul>
  </div>
</template>

<script>
import { useContext, useFetch, ref } from "@nuxtjs/composition-api";

export default {
  setup() {
    const { $axios } = useContext();
    
     const examples = ref('')

    const { fetch, fetchState } = useFetch(async () => {
      examples.value = await $axios.$get('/examples')
    })


    return { examples }
  },
};
</script>
