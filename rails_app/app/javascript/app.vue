<template>
  <v-app id="app">
    <div class="layout">
      <router-view></router-view>
    </div>
  </v-app>
</template>
<script>
export default {
  mounted() {
    let scriptEl = document.createElement('script')
    scriptEl.setAttribute('src', 'https://kit.fontawesome.com/98c77f9d64.js')
    scriptEl.setAttribute('crossorigin', 'anonymous')
    document.head.appendChild(scriptEl)

    scriptEl = document.createElement('script')
    scriptEl.setAttribute('src', 'https://code.jquery.com/jquery-1.10.2.js')
    document.head.appendChild(scriptEl)
  }
}
</script>