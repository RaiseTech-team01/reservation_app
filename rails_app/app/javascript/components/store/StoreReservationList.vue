<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <div class="container-fluid">
    <div class="row">
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <h2>予約一覧画面</h2>
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th>#</th>
                <th>日付</th>
                <th>予約者名</th>
                <th>時間帯</th>
                <th>予約人数</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1,001</td>
                <td>2021/06/15</td>
                <td>田中 一郎</td>
                <td>18:00~</td>
                <td>2</td>
              </tr>
              <tr>
                <td>1,002</td>
                <td>2021/06/15</td>
                <td>鈴木 次郎</td>
                <td>19:00~</td>
                <td>5</td>
              </tr>
              <tr>
                <td>1,003</td>
                <td>2021/06/16</td>
                <td>森田 三郎</td>
                <td>18:00~</td>
                <td>30</td>
              </tr>
              <tr>
                <td>1,003</td>
                <td>2021/06/16</td>
                <td>久保田 史郎</td>
                <td>23:30~</td>
                <td>3</td>
              </tr>
              <tr>
                <td>1,004</td>
                <td>2021/06/18</td>
                <td>吉本 六郎</td>
                <td>19:30~</td>
                <td>4</td>
              </tr>
              <tr>
                <td>1,005</td>
                <td>2021/06/19</td>
                <td>川上 七郎</td>
                <td>18:45~</td>
                <td>8</td>
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
import '../../css/bootstrap.min.css'
import '../../css/bootstrap/dashboard.css'

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
