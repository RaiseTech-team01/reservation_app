<template>
    <div class="main m-0">
        <dir class="storeheader m-0 text-center">
            <StoreHeader />
        </dir>
        <div class="container-fluid mt-20">
            <div class="row flex justify-center">
                <main class="col-md-9">
                    <h2>予約一覧画面</h2>
                    <div class="table-responsive">
                        <div
                            class="col-12 alert alert-danger"
                            v-show="hasError()"
                        >
                            <p>{{ errorMessage }}</p>
                        </div>
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
                                <tr
                                    v-for="item in reservationList"
                                    :key="item.id"
                                >
                                    <td>{{ item.id }}</td>
                                    <td>{{ item.date }}</td>
                                    <td>{{ item.user }}</td>
                                    <td>{{ item.startTime }}</td>
                                    <td>{{ item.seatNum }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>
        <div>
            <StoreFooter />
        </div>
    </div>
</template>

<script>
import StoreHeader from "@components/layout/StoreHeader.vue";
import StoreFooter from "@components/layout/StoreFooter.vue";
import axios from "axios";

export default {
    data: function () {
        return {
            loading: false,
            errorMessage: "",
            reservationList: [],
            requestHeaders: {},
        };
    },

    components: {
        StoreHeader,
        StoreFooter,
    },

    methods: {
        hasError() {
            return !!this.errorMessage;
        },
        validate(event) {
            if (!event.target.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            event.target.classList.add("was-validated");
        },
        addData(item) {
            this.reservationList.push(item);
        },
        makeHeaders(accessToken, client, uid) {
            let headers = {};
            headers["access-token"] = accessToken;
            headers["client"] = client;
            headers["uid"] = uid;
            return headers;
        },
        getDateString(reserveData) {
            // date_at: "2021-01-01T00:00:00.000+09:00"
            const date = reserveData.date_at;
            const str = date.match(/^(2[0-9]+)-([01][0-9])-([0-3][0-9])/);
            return str[1] + "/" + str[2] + "/" + str[3];
        },
        getTimeString(reserveData) {
            // date_at: "2021-01-01T00:00:00.000+09:00"
            const date = reserveData.date_at;
            const str = date.match(/T([0-2][0-9]):([0-5][0-9])/);
            return str[1] + ":" + str[2];
        },
        async requestRsrvData() {
            this.loading = true;

            const accessToken = localStorage.getItem("store-access-token");
            const client = localStorage.getItem("store-client");
            const uid = localStorage.getItem("store-uid");
            if (!(accessToken && client && uid)) {
                this.errorMessage =
                    "正常なログイン情報が格納されていません。再ログインしてください。";
                return;
            }
            this.requestHeaders = this.makeHeaders(accessToken, client, uid);

            await axios
                .get(
                    "/api/v1/stores/reservations",
                    { headers: this.requestHeaders },
                    { data: {} }
                )
                .then((response) => {
                    this.errorMessage = "";
                    const reserveData = response.data.map((rsrv) => {
                        return {
                            id: rsrv.id,
                            date: this.getDateString(rsrv),
                            user: rsrv.user.name,
                            startTime: this.getTimeString(rsrv),
                            seatNum: rsrv.number_people,
                        };
                    });
                    reserveData.forEach((item) => {
                        this.addData(item);
                    });
                })
                .catch((error) => {
                    this.errorMessage = error.response.data.errors[0];
                })
                .finally(() => {
                    this.loading = false;
                });
        },
        initialize() {
            this.requestRsrvData();
        },
    },
    mounted() {
        this.initialize();
    },
};
</script>

<style scoped src="@assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="@assets/stylesheets/dashboard.css"></style>
<style scoped>
p {
    font-size: 1em;
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
