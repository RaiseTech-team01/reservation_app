<template>
    <div class="main m-0">
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <dir class="navigation hidden md:block m-0 p-0">
                <Navigation :currentIndex="navIndex" />
            </dir>
            <div>
                <div>
                    <div class="grid grid-cols-6 grid-rows-6 gap-2">
                        <div class="col-span-2 row-span-6 h-auto">
                            <img
                                class="storemenu_img"
                                v-bind:src="storemenu_src"
                                alt="storemenu"
                            />
                        </div>
                        <div class="col-span-2 row-span-6 bg-blue-100 h-auto">
                            <form v-model="dataIndex">
                                <table
                                    class="
                                        m-2
                                        table-auto
                                        max-w-full
                                        md:w-full md:text-center
                                    "
                                >
                                    <tr class="h-24">
                                        <td
                                            class="
                                                block
                                                md:w-1/5 md:table-cell
                                                text-3xl
                                                md:text-4xl
                                                form-table-padding
                                                md:pl-6
                                                text-blue-800
                                            "
                                        >
                                            店舗
                                        </td>
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                space-x-4
                                                pb-6
                                                md:pb-0
                                            "
                                        >
                                            <div>
                                                <p
                                                    class="
                                                        inline-block
                                                        md:pr-16
                                                        text-3xl text-blue-800
                                                        font-bold
                                                    "
                                                >
                                                  {{userReservationData.reservationDataArray[userReservationDetail.rdId].store.name}}
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                text-3xl
                                                md:text-4xl
                                                form-table-padding
                                                md:pl-6
                                                text-blue-800
                                            "
                                        >
                                            日付
                                        </td>
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                pb-6
                                                md:pb-0
                                            "
                                        >
                                            <div>
                                                <p
                                                    class="
                                                        inline-block
                                                        md:pr-16
                                                        text-3xl text-blue-800
                                                        font-bold
                                                    "
                                                >
                                                  {{ userReservationData.reservationDataArray[userReservationDetail.rdId].date_on}}
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                text-3xl
                                                form-table-padding
                                                md:pl-6
                                                text-blue-800
                                            "
                                        >
                                            時間帯
                                        </td>
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                pb-6
                                                md:pb-0
                                            "
                                        >
                                            <p
                                                class="
                                                    inline-block
                                                    md:pr-16
                                                    text-3xl text-blue-800
                                                    font-bold
                                                    break-all
                                                "
                                            >
                                              {{ userReservationData.reservationDataArray[userReservationDetail.rdId].date_at}}～
                                            </p>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                text-3xl
                                                form-table-padding
                                                md:pl-6
                                                text-blue-800
                                                whitespace-nowrap
                                            "
                                        >
                                            ご利用人数
                                        </td>
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                pb-6
                                                md:pb-0
                                            "
                                        >
                                            <p
                                                class="
                                                    inline-block
                                                    md:pr-16
                                                    text-3xl text-blue-800
                                                    font-bold
                                                "
                                            >
                                              {{ userReservationData.reservationDataArray[userReservationDetail.rdId].number_people}}名様
                                            </p>
                                        </td>
                                    </tr>
                                    <tr class="h-24">
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                text-3xl
                                                form-table-padding
                                                md:pl-6
                                                text-blue-800
                                            "
                                        >
                                            ご予算
                                        </td>
                                        <td
                                            class="
                                                block
                                                md:table-cell
                                                pb-6
                                                md:pb-0
                                            "
                                        >
                                            <p
                                                class="
                                                    inline-block
                                                    md:pr-16
                                                    text-3xl text-blue-800
                                                    font-bold
                                                "
                                            >
                                              {{ userReservationData.reservationDataArray[userReservationDetail.rdId].budget}}円
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="col-span-2 row-span-5 bg-green-100 h-auto">
                            detail
                        </div>
                        <div
                            class="
                                col-span-2
                                row-span-1
                                bg-purple-100
                                w-full
                                flex
                            "
                        >
                            <button
                                class="
                                    flex-1
                                    bg-green-500
                                    hover:bg-green-700
                                    text-white
                                    font-bold
                                    py-2
                                    px-4
                                    rounded
                                "
                            >
                                Cancel
                            </button>
                            <div class="flex justify-center items-center w-20">
                                <input id="cancel" type="checkbox" />
                            </div>
                            <div class="flex w-56 items-center justify-center">
                                <label class="text-red-400" for="cancel"
                                    >cancel料金がかかります</label
                                >
                            </div>
                            <div
                                class="
                                    flex
                                    w-24
                                    justify-center
                                    items-center
                                    text-red-400
                                "
                            >
                                2000円
                            </div>
                        </div>
                        <div class="col-span-6 row-apan-6">
                            <div class="google_map">
                                <iframe
                                    v-bind:src="destination_url"
                                    width="100%"
                                    height="500px"
                                    style="border: 0"
                                    loading="lazy"
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <dir class="footer m-0 pl-0">
            <Footer />
        </dir>
    </div>
</template>

<script>
import axios from "axios";
import Router from "../router/router";
import Header from "./layout/Header.vue";
import Navigation from "./layout/Navigation.vue";
import Footer from "./layout/Footer.vue";
import {mapGetters} from "vuex";

const headers = {
    headers: {
        Authorization: "Bearer",
        "Access-Control-Allow-Origin": "*",
        "access-token": localStorage.getItem("access-token"),
        client: localStorage.getItem("client"),
        uid: localStorage.getItem("uid"),
    },
};

var count = {
    num: null,
    getNum: function () {
        return this.num++;
    },
};

export default {
    data: function () {
        return {
            destination_url: "",
            storemenu_src: "/storemenu/image01.png",
            navIndex: -1,
            dataIndex: "",
        };
    },
    props: {
        isFromHistory: Boolean,
    },
    created() {
        count.num = 0;
        this.getStoremap();
        this.storemenuSrcChange();
        this.navIndex = this.$route.params.isFromHistory ? 2 : 1;
        this.dataIndex = this.userReservationDetail.rdId;
    },

    components: {
        Header,
        Navigation,
        Footer,
    },

    methods: {
        getStoremap() {
            axios.get("/api/v1/user/storemaps/1", headers).then((response) => {
                this.destination_url = response.data.url;
            });
        },
        back() {
            Router.back();
        },
        storemenuSrcChange() {
            setInterval(this.change, 5000);
        },
        change() {
            if (count.num === 0) {
                this.storemenu_src = "/storemenu/image02.png";
                count.getNum();
            } else if (count.num === 1) {
                this.storemenu_src = "/storemenu/image03.png";
                count.getNum();
            } else {
                this.storemenu_src = "/storemenu/image01.png";
                count.num = 0;
            }
        },
    },
  computed: {
    ...mapGetters(["userData"]),
    ...mapGetters(["userReservationData"]),
    ...mapGetters(["userReservationDetail"]),
  },
};
</script>

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
</style>
