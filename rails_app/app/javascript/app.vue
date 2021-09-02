<template>
  <v-app id="app">
    <div class="layout">
      <router-view />
    </div>
  </v-app>
</template>
<script>
export default {
  mounted() {
    let scriptEl = document.createElement("script")
    scriptEl.setAttribute("src", "https://kit.fontawesome.com/98c77f9d64.js")
    scriptEl.setAttribute("crossorigin", "anonymous")
    document.head.appendChild(scriptEl)

    scriptEl = document.createElement("script")
    scriptEl.setAttribute("src", "https://code.jquery.com/jquery-3.6.0.js")
    document.head.appendChild(scriptEl)

    scriptEl = document.createElement("script")
    scriptEl.setAttribute(
      "src",
      "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    )
    scriptEl.setAttribute(
      "integrity",
      "sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
    )
    scriptEl.setAttribute("crossorigin", "anonymous")
    document.head.appendChild(scriptEl)
  },
}
</script>
