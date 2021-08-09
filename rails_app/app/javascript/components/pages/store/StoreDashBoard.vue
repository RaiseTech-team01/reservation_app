<template>
    <div class="main m-0">
        <dir class="storeheader m-0 text-center">
            <StoreHeader />
        </dir>
        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <h2>DashBoard</h2>
                </div>
                <div>
                    <p
                        class="
                            inline-block
                            md:pr-16
                            text-3xl text-blue-800
                            font-bold
                        "
                    >
                        {{ storeUserData.name }}
                    </p>
                </div>
                <div class="row g-5 flex justify-center">
                    <div class="col-md-7 col-lg-8">
                        <form
                            class="needs-validation"
                            @submit="validate"
                            novalidate
                        >
                            <div class="row g-3">
                                <div class="col-12 mb-3">
                                    <h2>直近の予約数</h2>
                                    <table class="table table-striped table-sm">
                                        <thead>
                                            <tr>
                                                <th>日付</th>
                                                <th>曜日</th>
                                                <th>予約組数</th>
                                                <th>予約人数</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2021/06/26</td>
                                                <td>金</td>
                                                <td>7</td>
                                                <td>32</td>
                                            </tr>
                                            <tr>
                                                <td>2021/06/27</td>
                                                <td>土</td>
                                                <td>8</td>
                                                <td>46</td>
                                            </tr>
                                            <tr>
                                                <td>2021/06/28</td>
                                                <td>日</td>
                                                <td>1</td>
                                                <td>10</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-12 mb-3">
                                    <h2>新規登録ユーザ</h2>
                                    <table class="table table-striped table-sm">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>ユーザ名</th>
                                                <th>年齢</th>
                                                <th>性別</th>
                                                <th>住所</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>ユーザ1</td>
                                                <td>30</td>
                                                <td>男性</td>
                                                <td>
                                                    東京都千代田区飯田橋234-5
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>ユーザ2</td>
                                                <td>38</td>
                                                <td>女性</td>
                                                <td>
                                                    埼玉県秩父市炭原町鉱田135-7
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>3</td>
                                                <td>ユーザ3</td>
                                                <td>46</td>
                                                <td>男性</td>
                                                <td>
                                                    栃木県那須塩原市池口246-8
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </main>

            <StoreFooter />
        </div>
    </div>
</template>

<script>
import StoreHeader from "@components/layout/StoreHeader.vue";
import StoreFooter from "@components/layout/StoreFooter.vue";
import { mapGetters } from "vuex";

export default {
    data: function () {
        return {};
    },

    components: {
        StoreHeader,
        StoreFooter,
    },

    methods: {
        validate(event) {
            if (!event.target.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            event.target.classList.add("was-validated");
        },
    },

    computed: {
        ...mapGetters(["storeUserData"]),
    },
};
</script>

<style scoped src="@assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="@assets/stylesheets/dashboard.css"></style>
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
