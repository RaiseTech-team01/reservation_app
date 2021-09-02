<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <main>
      <div class="mt-5 py-5 text-center">
        <h2>予約詳細</h2>
      </div>
      <div class="row g-5 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <table class="table">
            <thead>
              <tr>
                <th>種別</th>
                <th>入力内容</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>予約番号</td>
                <td>
                  {{ reservationDetailData.reservation_number }}
                </td>
              </tr>
              <tr>
                <td>店舗名</td>
                <td>
                  {{ reservationDetailData.store_name }}
                </td>
              </tr>
              <tr>
                <td>予約日</td>
                <td>
                  {{ makeDateStr() }}
                </td>
              </tr>
              <tr>
                <td>開始時刻</td>
                <td>
                  {{ makeTimeStr() }}
                </td>
              </tr>
              <tr>
                <td>ご利用人数</td>
                <td>
                  {{ reservationDetailData.number_people }}
                </td>
              </tr>
              <tr>
                <td>ご予算</td>
                <td>
                  {{ reservationDetailData.budget }}
                </td>
              </tr>
              <tr>
                <td>店舗住所</td>
                <td>
                  {{ reservationDetailData.store_address }}
                </td>
              </tr>
              <tr>
                <td>店舗電話番号</td>
                <td>
                  {{ reservationDetailData.store_tel }}
                </td>
              </tr>
              <tr>
                <td>店舗メールアドレス</td>
                <td>
                  {{ reservationDetailData.store_email }}
                </td>
              </tr>
              <tr>
                <td>店舗URL</td>
                <td>
                  {{ reservationDetailData.store_url }}
                </td>
              </tr>
              <tr>
                <td>個人情報保護方針</td>
                <td>同意する</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="text-center mt-5">
        <button
          type="button"
          class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
          @click.prevent="back"
        >
          戻　る
        </button>
      </div>
      <div class="mt-5 py-5 text-center">
        <h2>店舗地図</h2>
      </div>
      <div class="row g-5 flex justify-center">
        <div class="col-6">
          <p class="mt-3 fs-4">
            住所：{{ reservationDetailData.store_address }}
          </p>
          <img
            src="/map-sample.png"
            class="rounded mx-auto d-block"
            alt="map"
          />
        </div>
      </div>
      <div class="text-center mt-5">
        <button
          type="button"
          class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
          @click.prevent="back"
        >
          戻　る
        </button>
      </div>
      <div class="mt-5 py-5 text-center">
        <h2>メニュー例</h2>
      </div>
      <div class="col-6 m-auto">
        <div
          id="carouselExampleCaptions"
          class="carousel slide"
          data-bs-ride="carousel"
        >
          <ol class="carousel-indicators">
            <li
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="0"
              class="active"
            />
            <li
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="1"
            />
            <li
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="2"
            />
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                src="/storemenu/image01.png"
                class="d-block w-100"
                alt="image 1"
              />
              <div
                class="
                  carousel-caption
                  d-none d-md-block
                  text-rt-red
                  bg-gradation
                "
              >
                <h5>当店人気 No.1 メニュー</h5>
                <p>漁港直送！越前がにと鮮魚の桶盛</p>
              </div>
            </div>
            <div class="carousel-item">
              <img
                src="/storemenu/image02.png"
                class="d-block w-100"
                alt="image 2"
              />
              <div
                class="
                  carousel-caption
                  d-none d-md-block
                  text-rt-red
                  bg-gradation
                "
              >
                <h5>当店人気 No.2 メニュー</h5>
                <p>最高級！越前がにの炭火焼</p>
              </div>
            </div>
            <div class="carousel-item">
              <img
                src="/storemenu/image03.png"
                class="d-block w-100"
                alt="image 3"
              />
              <div
                class="
                  carousel-caption
                  d-none d-md-block
                  text-rt-red
                  bg-gradation
                "
              >
                <h5>当店人気 No.3 メニュー</h5>
                <p>天然岩牡蠣！食べ比べセット</p>
              </div>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#carouselExampleCaptions"
            role="button"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true" />
            <span class="visually-hidden">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#carouselExampleCaptions"
            role="button"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true" />
            <span class="visually-hidden">Next</span>
          </a>
        </div>
      </div>
      <div class="text-center mt-5">
        <button
          type="button"
          class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
          @click.prevent="back"
        >
          戻　る
        </button>
      </div>
    </main>
  </div>
</template>

<script>
import axios from "axios"
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import { mapGetters } from "vuex"

const headers = {
  headers: {
    Authorization: "Bearer",
    "Access-Control-Allow-Origin": "*",
    "access-token": localStorage.getItem("access-token"),
    client: localStorage.getItem("client"),
    uid: localStorage.getItem("uid"),
  },
}

var count = {
  num: null,
  getNum: function () {
    return this.num++
  },
}

export default {
  data: function () {
    return {
      reservationDetailData: {
        reservation_number: "",
        store_name: "",
        store_address: "",
        store_tel: "",
        store_email: "",
        store_url: "",
        date: new Date(),
        hour: "",
        minute: "",
        number_people: "",
        budget: "",
      },
      destination_url: "",
      storemenu_src: "/storemenu/image01.png",
      navIndex: -1,
      dataIndex: "",
    }
  },
  props: {
    isFromHistory: Boolean,
  },
  created() {
    count.num = 0
    this.getStoremap()
    this.storemenuSrcChange()
    this.navIndex = this.$route.params.isFromHistory ? 2 : 1
    this.dataIndex = this.userReservationDetail.rdId
  },

  components: {
    Header,
    Navigation,
    Footer,
  },

  methods: {
    getStoremap() {
      axios.get("/api/v1/user/storemaps/1", headers).then((response) => {
        this.destination_url = response.data.url
      })
    },
    back() {
      Router.back()
    },
    storemenuSrcChange() {
      setInterval(this.change, 5000)
    },
    change() {
      if (count.num === 0) {
        this.storemenu_src = "/storemenu/image02.png"
        count.getNum()
      } else if (count.num === 1) {
        this.storemenu_src = "/storemenu/image03.png"
        count.getNum()
      } else {
        this.storemenu_src = "/storemenu/image01.png"
        count.num = 0
      }
    },
    addOption(select, value) {
      if (select.childNodes.length > 0) {
        select.removeChild(select.firstChild)
      }
      let option = document.createElement("option")
      option.setAttribute("value", value)
      option.innerHTML = value
      select.appendChild(option)
    },
    convertTwoDigit(value) {
      return ("0" + value).slice(-2)
    },
    makeDateStr() {
      return (
        this.reservationDetailData.date.getFullYear() +
        "-" +
        this.convertTwoDigit(this.reservationDetailData.date.getMonth() + 1) +
        "-" +
        this.convertTwoDigit(this.reservationDetailData.date.getDate())
      )
    },
    makeTimeStr() {
      return (
        this.reservationDetailData.hour +
        ":" +
        this.reservationDetailData.minute
      )
    },
    initializeDetailData() {
      const idx = this.userReservationDetail.rdId
      const rsrvData = this.userReservationData.reservationDataArray.find(
        (r) => r.id === idx
      )
      console.log("rd", rsrvData)
      this.reservationDetailData.reservation_number =
        rsrvData.reservation_number
      this.reservationDetailData.store_name = rsrvData.store.name
      this.reservationDetailData.store_address = rsrvData.store.address
      this.reservationDetailData.store_tel = rsrvData.store.tel
      this.reservationDetailData.store_email = rsrvData.store.email
      this.reservationDetailData.store_url = rsrvData.store.url
      const matches = rsrvData.date_at.match(
        /^([0-9]{4})-([01][0-9])-([0-3][0-9])T([0-2][0-9]):([0-5][0-9])/
      )
      const year = matches[1]
      const month = matches[2]
      const day = matches[3]
      const hours = matches[4]
      const minutes = matches[5]

      this.reservationDetailData.date = new Date(rsrvData.date_at)
      this.reservationDetailData.hour = hours
      this.reservationDetailData.minute = minutes
      // this.setTime(hours, minutes)
      this.reservationDetailData.number_people = rsrvData.number_people
      this.reservationDetailData.budget = rsrvData.budget
    },
  },
  computed: {
    ...mapGetters(["userData"]),
    ...mapGetters(["userReservationData"]),
    ...mapGetters(["userReservationDetail"]),
  },
  mounted() {
    this.initializeDetailData()
  },
}
</script>

<style scoped src="../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../assets/stylesheets/customize.css"></style>
<style scoped>
p {
  font-size: 2em;
}

.google_map {
  width: 100%;
  height: 500px;
}

.storemenu_img {
  height: 500px;
}

.bg-gradation {
  background: -moz-radial-gradient(
    rgba(255, 255, 255, 0.75),
    rgba(255, 255, 255, 0)
  );
  background: -webkit-radial-gradient(
    rgba(255, 255, 255, 0.75),
    rgba(255, 255, 255, 0)
  );
  background: radial-gradient(
    rgba(255, 255, 255, 0.75),
    rgba(255, 255, 255, 0)
  );
}
</style>
s
