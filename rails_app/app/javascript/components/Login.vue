<template>
    <div class="main m-0">
        <dir class="header m-0 pl-0 text-center">
            <Header />
        </dir>
        <main>
            <!-- min-widthを設定する -->
            <dir class="navigation m-0 pl-0 hidden md:block">
                <Navigation />
            </dir>
            <div class="flex justify-center">
                <div class="bg-gray-300 info-container">
                    <div>
                        <h3 class="mt-4 ml-4 text-xl text-blue-800">
                            <a class="font-bold" href="/home/top">トップ</a>
                            <span> > </span>
                            <a class="font-bold" href="/login">ログイン</a>
                        </h3>
                    </div>
                    <div>
                        <h2
                            class="
                                mt-16
                                mb-8
                                font-bold
                                text-3xl
                                md:text-4xl
                                text-center text-blue-800
                            "
                        >
                            予約サービス ログインページ
                        </h2>
                    </div>
                    <div class="flex justify-center">
                        <p
                            v-for="item in $store.getters.userData.errs"
                            class="
                                mx-30
                                my-4
                                w-3/4
                                text-align text-red-800
                                border-2
                            "
                        >
                            {{ item }}
                        </p>
                    </div>
                    <div>
                        <form class="mt-10 ml-10">
                            <table>
                                <tbody>
                                    <tr>
                                        <th
                                            class="
                                                pr-3
                                                pb-10
                                                text-2xl
                                                text-blue-800
                                                text-right
                                                border-none
                                            "
                                        >
                                            ID
                                        </th>
                                        <td class="border-none pb-10">
                                            <input
                                                id="user_email"
                                                v-model="typedEmail"
                                                name="email"
                                                type="email"
                                                class="
                                                    w-80
                                                    h-10
                                                    border-blue-800 border-2
                                                "
                                                autocomplete="email"
                                                placeholder="tanaka@sample.com"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th
                                            class="
                                                pr-3
                                                text-2xl
                                                text-blue-800
                                                text-right
                                                border-none
                                            "
                                        >
                                            パスワード
                                        </th>
                                        <td class="border-none">
                                            <input
                                                id="user_pass"
                                                v-model="typedPassword"
                                                name="password"
                                                type="password"
                                                class="
                                                    w-80
                                                    h-10
                                                    border-blue-800 border-2
                                                "
                                                autocomplete="on"
                                            />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="login_checkbox" class="mt-10 text-center">
                                <input
                                    id="is_auto_login"
                                    class="
                                        radiox
                                        inline-block
                                        mr-4
                                        align-middle
                                        transform
                                        scale-150
                                    "
                                    name="is_auto_login"
                                    type="checkbox"
                                />
                                <label
                                    class="
                                        my-4
                                        text-2xl
                                        md:text-3xl
                                        font-bold
                                        align-middle
                                        text-blue-800
                                        hover:text-blue-600
                                    "
                                    for="is_auto_login"
                                    >次からは自動でログインする</label
                                ><br />
                            </div>
                            <div
                                class="text-center space-x-4 md:space-x-8 my-14"
                            >
                                <input
                                    class="
                                        inline-block
                                        w-2/5
                                        py-2
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        text-4xl text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="submit"
                                    :loading="loading"
                                    @click.prevent="submit"
                                    value="ログイン"
                                />
                                <input
                                    class="
                                        inline-block
                                        w-2/5
                                        py-2
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        text-4xl text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="button"
                                    @click.prevent="back"
                                    value="戻る"
                                />
                            </div>
                        </form>
                        <div class="text-center mt-10 text-blue-800 mb-28">
                            <p
                                class="
                                    my-4
                                    px-4
                                    text-2xl
                                    leading-relaxed
                                    align-middle
                                    text-blue-800
                                "
                            >
                                アカウント未登録の方は下記から登録してください。
                            </p>
                            <input
                                class="
                                    inline-block
                                    w-1/2
                                    py-2
                                    my-4
                                    rounded-xl
                                    font-bold
                                    bg-yellow-200
                                    text-4xl text-blue-800
                                    cursor-pointer
                                    hover:bg-yellow-100 hover:text-blue-600
                                    active:bg-red-200
                                "
                                type="button"
                                value="新規登録"
                                @click.prevent="goToRegistration"
                            />
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <dir class="footer m-0 p-0">
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

export default {
    data: function () {
        return {
            typedEmail: "",
            typedPassword: "",
            loginedUserData: {
                address: "",
                allow_password_change: "",
                birthday: "",
                email: "",
                furigana: "",
                gender: "",
                id: "",
                image: "",
                name: "",
                provider: "",
                tel: "",
                uid: "",
            },
        };
    },

    components: {
        Header,
        Navigation,
        Footer,
    },

    methods: {
        // ログイン情報を送信する
        async submit() {
            this.typedEmail = document.getElementById("user_email").value;
            this.typedPassword = document.getElementById("user_pass").value;
            this.loading = true;
            const params = {
                email: `${this.typedEmail}`,
                password: `${this.typedPassword}`,
            };
            await axios
                .post("/api/v1/auth/sign_in", params)
                .then((response) => {
                    localStorage.setItem(
                        "access-token",
                        response.headers["access-token"]
                    );
                    localStorage.setItem("uid", response.headers["uid"]);
                    localStorage.setItem("client", response.headers["client"]);

                    // console.log(response.data.data)
                    this.loginedUserData = response.data.data;
                    console.log(this.loginedUserData);

                    // Vuex store
                    this.$store.dispatch(
                        "userData/update",
                        this.loginedUserData
                    );
                    this.$store.dispatch("auth/updateLogin", true);
                    Router.push("/api/v1/user/account_info");
                })
                .catch((error) => {
                    // TODO: 適切な Error 表示
                    console.log(error.response),
                        console.log(error.response.data.errors),
                        this.$store.dispatch(
                            "userData/updateErr",
                            error.response.data.errors
                        );
                    Router.push("/login");
                })
                .finally(() => {
                    this.loading = false;
                });
            console.log("axios finished");
        },
        goToRegistration() {
            Router.push("/sign_up");
        },
        back() {
            Router.back();
        },
    },
};
</script>

<style scoped>
/* ラベルのスタイル　*/
#login_checkbox label {
    padding-left: 38px; /* ラベルの位置 */
    line-height: 32px;
    display: inline-block;
    cursor: pointer;
    position: relative;
}

/* ボックスのスタイル */
#login_checkbox label:before {
    content: "";
    width: 32px; /* ボックスの横幅 */
    height: 32px; /* ボックスの縦幅 */
    display: inline-block;
    position: absolute;
    left: 0;
    background-color: #fff;
    border: 2px solid #1e40af;
}
/* 元のチェックボックスを表示しない */
#login_checkbox input[type="checkbox"] {
    display: none;
}
/* チェックした時のスタイル */
#login_checkbox input[type="checkbox"]:checked + label:before {
    content: "\2713"; /* チェックの文字 */
    font-size: 24px; /* チェックのサイズ */
    color: #fff; /* チェックの色 */
    background-color: #06f; /* チェックした時の色 */
}
</style>
