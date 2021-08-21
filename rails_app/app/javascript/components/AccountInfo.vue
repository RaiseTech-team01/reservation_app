<template>
    <div class="main m-0">
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <dir class="navigation hidden md:block m-0 p-0">
                <Navigation :currentIndex="3" />
            </dir>
            <div class="flex justify-center">
                <div class="bg-gray-300 info-container">
                    <BreadClumbList :bcList="breadClumbList" />
                    <div>
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
                                            {{ userData.name }}
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
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <div>
                                        <p
                                            class="
                                                inline-block
                                                md:pr-16
                                                text-3xl text-blue-800
                                                font-bold
                                            "
                                        >
                                            {{ userData.furigana }}
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
                                    メール<br class="hidden md:block" />アドレス
                                </td>
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <p
                                        class="
                                            inline-block
                                            md:pr-16
                                            text-3xl text-blue-800
                                            font-bold
                                            break-all
                                        "
                                    >
                                        {{ userData.email }}
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
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <p
                                        class="
                                            inline-block
                                            md:pr-16
                                            text-3xl text-blue-800
                                            font-bold
                                        "
                                    >
                                        {{ userData.tel }}
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
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <p
                                        class="
                                            inline-block
                                            md:pr-16
                                            text-3xl text-blue-800
                                            font-bold
                                        "
                                    >
                                        {{ getAgeStr(userData.birthday) }} 歳
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
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <p
                                        class="
                                            inline-block
                                            md:pr-16
                                            text-3xl text-blue-800
                                            font-bold
                                        "
                                    >
                                        {{ userData.gender }}
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
                                <td class="block md:table-cell pb-6 md:pb-0">
                                    <p
                                        class="
                                            inline-block
                                            md:pr-16
                                            text-3xl text-blue-800
                                            font-bold
                                            break-all
                                        "
                                    >
                                        {{ userData.address }}<br />
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
                                type="button"
                                value="編　集"
                                @click.prevent="goToAccountEdit"
                            />
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
import Router from "../router/router";
import Header from "./layout/Header.vue";
import Navigation from "./layout/Navigation.vue";
import Footer from "./layout/Footer.vue";
import BreadClumbList from "./commons/layouts/BreadClumbList.vue";
import { mapGetters } from "vuex";
import { getAge } from "../utils/utils";

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
        getAgeStr(birthday) {
            return getAge(birthday);
        },
        goToAccountEdit() {
            Router.push("/api/v1/user/account_edit");
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
}
</style>
