<template>
    <div class="main m-0">
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <div class="flex justify-center">
                <div class="bg-gray-300 info-container">
                    <BreadClumbList :bcList="breadClumbList" />
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
                            アカウント情報の編集
                        </h2>
                        <form>
                            <table class="m-2 md:m-10 table-auto">
                                <tr>
                                    <td
                                        class="
                                            text-3xl
                                            mg:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        氏名
                                    </td>
                                    <td class="space-x-4">
                                        <div
                                            class="
                                                flex
                                                justify-between
                                                space-x-2
                                                md:flex-none
                                            "
                                        >
                                            <input
                                                class="
                                                    w-3/4
                                                    md:w-80
                                                    h-12
                                                    md:mr-4
                                                    border-2
                                                    md:border-4
                                                    border-blue-700
                                                    bg-gray-100
                                                    pl-4
                                                    text-3xl
                                                "
                                                type="text"
                                                v-model="userData.name"
                                            />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-3xl
                                            mg:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        カナ
                                    </td>
                                    <td>
                                        <div
                                            class="
                                                flex
                                                justify-between
                                                space-x-2
                                                md:flex-none
                                            "
                                        >
                                            <input
                                                class="
                                                    w-3/4
                                                    md:w-80
                                                    h-12
                                                    md:mr-4
                                                    border-2
                                                    md:border-4
                                                    border-blue-700
                                                    bg-gray-100
                                                    pl-4
                                                    text-3xl
                                                "
                                                v-model="userData.furigana"
                                                type="text"
                                            />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-2xl
                                            md:text-3xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        メール<br class="md:hidden" />アドレス
                                    </td>
                                    <td>
                                        <input
                                            class="
                                                w-full
                                                md:w-96
                                                h-12
                                                border-2
                                                md:border-4
                                                border-blue-700
                                                bg-gray-100
                                                pl-4
                                                text-3xl
                                            "
                                            v-model="userData.email"
                                            type="email"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-2xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        電話<br class="md:hidden" />番号
                                    </td>
                                    <td>
                                        <input
                                            class="
                                                w-full
                                                md:w-96
                                                h-12
                                                border-2
                                                md:border-4
                                                border-blue-700
                                                bg-gray-100
                                                pl-4
                                                text-3xl
                                            "
                                            v-model="userData.tel"
                                            type="tel"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-3xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        年齢
                                    </td>
                                    <td>
                                        <input
                                            class="
                                                w-1/2
                                                md:w-44
                                                h-12
                                                border-2
                                                md:border-4
                                                border-blue-700
                                                bg-gray-100
                                                pl-4
                                                text-3xl
                                            "
                                            v-model="userData.birthday"
                                            type="text"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-3xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        性別
                                    </td>
                                    <td>
                                        <input
                                            class="
                                                w-1/2
                                                md:w-44
                                                h-12
                                                border-2
                                                md:border-4
                                                border-blue-700
                                                bg-gray-100
                                                pl-4
                                                text-3xl
                                            "
                                            v-model="userData.gender"
                                            type="text"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        class="
                                            text-3xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            p-4
                                            md:p-6
                                            text-blue-800
                                        "
                                    >
                                        住所
                                    </td>
                                    <td>
                                        <input
                                            class="
                                                w-full
                                                md:w-96
                                                h-12
                                                border-2
                                                md:border-4
                                                border-blue-700
                                                bg-gray-100
                                                pl-4
                                                text-3xl
                                            "
                                            v-model="userData.address"
                                            type="text"
                                        />
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
                                    type="button"
                                    value="保　存"
                                    @click.prevent="save"
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
                                    value="キャンセル"
                                    @click.prevent="cancel"
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
import BreadClumbList from "./commons/layouts/BreadClumbList.vue";

export default {
    data: function () {
        return {
            breadClumbList: [
                {
                    title: "トップ",
                    href: "/home/top",
                },
                {
                    title: "アカウント設定",
                    href: "/api/v1/user/account_info",
                },
                {
                    title: "アカウント編集",
                },
            ],
        };
    },

    components: {
        Header,
        Navigation,
        Footer,
        BreadClumbList,
    },

    methods: {
        save() {
            // TODO 入力データの保存処理

            this.goToAccountInfo();
        },
        cancel() {
            Router.back();
        },
        goToAccountInfo() {
            Router.push("/api/v1/user/account_info");
        },
    },
    computed: {
        ...mapGetters(["userData"]),
    },
};
</script>

<style scoped>
p {
    font-size: 2em;
    text-align: center;
}
</style>
