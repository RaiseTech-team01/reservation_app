<template>
    <div class="main m-0">
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <div class="flex justify-center">
                <div class="bg-gray-300 info-container">
                    <div>
                        <h3 class="mt-10 ml-4 text-xl text-blue-800">
                            <a
                                class="font-bold hover:text-blue-500"
                                href="/home/top"
                                >トップ</a
                            >
                            <span> > </span>
                            <a
                                class="font-bold hover:text-blue-500"
                                href="/login"
                                >ログイン</a
                            >
                            <span> > </span>
                            <a
                                class="font-bold hover:text-blue-500"
                                href="/sign_up"
                                >新規登録確認</a
                            >
                        </h3>
                    </div>
                    <div class="mt-16">
                        <div>
                            <p
                                class="
                                    text-center
                                    whitespace-nowrap
                                    flex
                                    justify-around
                                    md:justify-center
                                    md:space-x-12
                                    md:transform
                                    md:scale-125
                                    md:flex-none
                                "
                            >
                                <span class="arrow-block-inactive">入力</span>
                                <span class="arrow-block">確認</span>
                                <span class="arrow-block-inactive">登録</span>
                            </p>
                        </div>
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
                            下記の情報を登録して良いですか？
                        </h2>
                        <form>
                            <table
                                class="
                                    m-2
                                    mt-10
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
                                        氏名
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
                                                {{
                                                    registrationUserData.last_name +
                                                    " " +
                                                    registrationUserData.first_name
                                                }}
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
                                        カナ
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
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
                                                {{
                                                    registrationUserData.last_furigana +
                                                    " " +
                                                    registrationUserData.first_furigana
                                                }}
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
                                        メール<br
                                            class="hidden md:block"
                                        />アドレス
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
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
                                            {{ registrationUserData.email }}
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
                                        電話<br class="hidden md:block" />番号
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
                                    >
                                        <p
                                            class="
                                                inline-block
                                                md:pr-16
                                                text-3xl text-blue-800
                                                font-bold
                                            "
                                        >
                                            {{ registrationUserData.tel }}
                                        </p>
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
                                        年齢
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
                                    >
                                        <p
                                            class="
                                                inline-block
                                                md:pr-16
                                                text-3xl text-blue-800
                                                font-bold
                                            "
                                        >
                                            {{
                                                registrationUserData.birthday
                                            }}歳
                                        </p>
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
                                        性別
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
                                    >
                                        <p
                                            class="
                                                inline-block
                                                md:pr-16
                                                text-3xl text-blue-800
                                                font-bold
                                            "
                                        >
                                            {{ registrationUserData.gender }}
                                        </p>
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
                                        住所
                                    </td>
                                    <td
                                        class="block md:table-cell pb-6 md:pb-0"
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
                                            {{ registrationUserData.address }}
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            <div
                                class="
                                    text-center
                                    space-x-4
                                    md:space-x-8
                                    mt-14
                                    mb-28
                                "
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
                                    @click.prevent="goToComplete"
                                    type="button"
                                    value="登録完了"
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
                                    @click.prevent="toForm"
                                    type="button"
                                    value="戻　る"
                                />
                            </div>
                        </form>
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
import Router from "../router/router";
import Header from "./layout/Header.vue";
import Navigation from "./layout/Navigation.vue";
import Footer from "./layout/Footer.vue";
import { mapGetters } from "vuex";
import axios from "axios";

export default {
    data: function () {
        return {
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
        goToComplete: function () {
            const addUserParams = this.$store.getters.registrationUserData;
            addUserParams.name =
                addUserParams.last_name + " " + addUserParams.first_name;
            addUserParams.furigana =
                addUserParams.last_furigana +
                " " +
                addUserParams.first_furigana;
            // 以下の書式でいらないデータを削除
            delete addUserParams.errs;

            axios
                .post("/api/v1/auth/", addUserParams)
                .then(function (response) {
                    console.log(response);
                    localStorage.setItem(
                        "access-token",
                        response.headers["access-token"]
                    );
                    localStorage.setItem("uid", response.headers["uid"]);
                    localStorage.setItem("client", response.headers["client"]);
                    Router.push("/sign_up_complete");
                })
                .catch((error) => {
                    console.log(error.response.data.errors.full_messages);
                    this.$store.dispatch(
                        "registrationUserData/updateErr",
                        error.response.data.errors.full_messages
                    );
                    Router.push("/sign_up");
                });
            // this.$store.dispatch('registrationUserData/post')
        },
        toForm() {
            Router.push("/sign_up");
        },
    },
    computed: {
        ...mapGetters(["registrationUserData"]),
    },
};
</script>

<style scoped>
p {
    font-size: 2em;
}
</style>

// calc age // name: `${this.registrationUserData.last_name} + " " +
${this.registrationUserData.first_name}`, // furigana:
`${this.registrationUserData.last_furigana} + " " +
${this.registrationUserData.first_furigana}`, // // email:
`${this.registrationUserData.email}`, // tel:
`${this.registrationUserData.tel}`, // birthday:
`${this.registrationUserData.birthday}`, // gender:
`${this.registrationUserData.gender}`, // address:
`${this.registrationUserData.address}`, // password:
`${this.registrationUserData.password}`, // password_confirmation:
`${this.registrationUserData.password_confirmation}`, // }
