<template>
    <div class="main m-0">
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <dir class="navigation hidden md:block m-0 p-0">
                <Navigation :currentIndex="2" />
            </dir>
            <div class="flex justify-center">
                <div class="bg-gray-300 info-container">
                    <BreadClumbList :bcList="breadClumbList" />
                    <div class="mt-16 flex flex-col mx-16 mb-16">
                        <div>
                            <table
                                class="
                                    text-2xl
                                    font-bold
                                    text-blue-800
                                    border-t-2 border-blue-800
                                    mx-4
                                    md:table
                                    block
                                "
                            >
                                <tr class="md:table-row block">
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        店舗：
                                    </td>
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        居酒屋A イロハ駅前店
                                    </td>
                                    <td class="p-2 md:table-cell hidden">
                                        <input
                                            class="
                                                inline-block
                                                w-20
                                                py-1
                                                rounded-xl
                                                font-bold
                                                bg-yellow-300
                                                md:text-xl
                                                text-lg text-blue-800
                                                cursor-pointer
                                                hover:bg-yellow-200
                                                hover:text-blue-600
                                                active:bg-red-200
                                            "
                                            type="button"
                                            value="詳細"
                                            @click.prevent="goToDetail"
                                        />
                                    </td>
                                </tr>
                                <tr class="md:table-row block mt-4">
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        予約日時：
                                    </td>
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        2021年3月20日 18:00～
                                    </td>
                                    <td class="p-2 md:table-cell hidden">
                                        <input
                                            class="
                                                inline-block
                                                w-20
                                                py-1
                                                rounded-xl
                                                font-bold
                                                bg-yellow-300
                                                md:text-xl
                                                text-lg text-blue-800
                                                cursor-pointer
                                                hover:bg-yellow-200
                                                hover:text-blue-600
                                                active:bg-red-200
                                            "
                                            type="button"
                                            value="変更"
                                            @click.prevent="goToEdit"
                                        />
                                    </td>
                                </tr>
                                <tr class="md:table-row block mt-4">
                                    <td
                                        class="pl-2 md:p-2 md:table-cell block"
                                    />
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        人数：3名　<br
                                            class="md:hidden"
                                        />コース予約：なし
                                    </td>
                                </tr>
                            </table>
                            <div
                                class="
                                    my-4
                                    md:my-0
                                    text-center
                                    space-x-6
                                    md:hidden
                                "
                            >
                                <input
                                    class="
                                        inline-block
                                        w-20
                                        py-1
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        md:text-xl
                                        text-lg text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="button"
                                    value="詳細"
                                    @click.prevent="goToDetail"
                                />
                                <input
                                    class="
                                        inline-block
                                        w-20
                                        py-1
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        md:text-xl
                                        text-lg text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="button"
                                    value="変更"
                                    @click.prevent="goToEdit"
                                />
                            </div>
                        </div>
                        <div>
                            <table
                                class="
                                    text-2xl
                                    font-bold
                                    text-blue-800
                                    border-t-2
                                    md:border-b-2
                                    border-blue-800
                                    mx-4
                                    md:table
                                    block
                                "
                            >
                                <tr class="md:table-row block">
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        店舗：
                                    </td>
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        居酒屋B ホヘト駅前店
                                    </td>
                                    <td class="p-2 md:table-cell hidden">
                                        <input
                                            class="
                                                inline-block
                                                w-20
                                                py-1
                                                rounded-xl
                                                font-bold
                                                bg-yellow-300
                                                md:text-xl
                                                text-lg text-blue-800
                                                cursor-pointer
                                                hover:bg-yellow-200
                                                hover:text-blue-600
                                                active:bg-red-200
                                            "
                                            type="button"
                                            value="詳細"
                                            @click.prevent="goToDetail"
                                        />
                                    </td>
                                </tr>
                                <tr class="md:table-row block mt-4">
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        予約日時：
                                    </td>
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        2021年3月19日 17:00～
                                    </td>
                                    <td class="p-2 md:table-cell hidden">
                                        <input
                                            class="
                                                inline-block
                                                w-20
                                                py-1
                                                rounded-xl
                                                font-bold
                                                bg-yellow-300
                                                md:text-xl
                                                text-lg text-blue-800
                                                cursor-pointer
                                                hover:bg-yellow-200
                                                hover:text-blue-600
                                                active:bg-red-200
                                            "
                                            type="button"
                                            value="変更"
                                            @click.prevent="goToEdit"
                                        />
                                    </td>
                                </tr>
                                <tr class="md:table-row block mt-4">
                                    <td
                                        class="pl-2 md:p-2 md:table-cell block"
                                    />
                                    <td class="pl-2 md:p-2 md:table-cell block">
                                        人数：2名　<br
                                            class="md:hidden"
                                        />コース予約：あり
                                    </td>
                                </tr>
                            </table>
                            <div
                                class="
                                    my-4
                                    pb-4
                                    md:my-0
                                    text-center
                                    space-x-6
                                    md:hidden
                                    border-b-2 border-blue-800
                                "
                            >
                                <input
                                    class="
                                        inline-block
                                        w-20
                                        py-1
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        md:text-xl
                                        text-lg text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="button"
                                    value="詳細"
                                    @click.prevent="goToDetail"
                                />
                                <input
                                    class="
                                        inline-block
                                        w-20
                                        py-1
                                        rounded-xl
                                        font-bold
                                        bg-yellow-300
                                        md:text-xl
                                        text-lg text-blue-800
                                        cursor-pointer
                                        hover:bg-yellow-200 hover:text-blue-600
                                        active:bg-red-200
                                    "
                                    type="button"
                                    value="変更"
                                    @click.prevent="goToEdit"
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
import Router from "../router/router";
import Header from "./layout/Header.vue";
import Navigation from "./layout/Navigation.vue";
import Footer from "./layout/Footer.vue";
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
                    title: "予約履歴",
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
        goToDetail() {
            Router.push({
                name: "ReservationDetail",
                params: { isFromHistory: true },
            });
        },
        goToEdit() {
            Router.push({
                name: "ReservationEdit",
                params: { isFromHistory: true },
            });
        },
    },
};
</script>

<style scoped>
p {
    font-size: 2em;
    text-align: center;
}
</style>
