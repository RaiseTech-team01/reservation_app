<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <p>test</p>
</div>
</template>

<script>
import StoreHeader from "../layout/StoreHeader.vue"

export default {
  data: function () {
    return {
    }
  },

  components: {
    StoreHeader,
  },

  methods: {
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
