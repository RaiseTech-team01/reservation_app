<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <div class="container-fluid mt-20">
    <div class="row flex justify-center">
      <main class="col-md-9">
        <h2>ユーザ一覧画面</h2>
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th>#</th>
                <th>ユーザ名</th>
                <th>メールアドレス</th>
                <th>年齢</th>
                <th>性別</th>
                <th>電話番号</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>田中一郎</td>
                <td>user1@sample.com</td>
                <td>30</td>
                <td>男性</td>
                <td>08011112222</td>
              </tr>
              <tr>
                <td>2</td>
                <td>佐藤二郎</td>
                <td>user2@sample.com</td>
                <td>35</td>
                <td>男性</td>
                <td>08033334444</td>
              </tr>
              <tr>
                <td>3</td>
                <td>川上三郎</td>
                <td>user3@sample.com</td>
                <td>40</td>
                <td>男性</td>
                <td>08055556666</td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
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
    validate(event) {
      if (!event.target.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      event.target.classList.add('was-validated')
    }
  }
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/dashboard.css"></style>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
</style>
