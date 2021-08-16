<template>
    <div id="list">
        <h3 class="mt-10 ml-4 text-xl text-blue-800">
            <span v-for="(item, index) in bcList" :key="index">
                <a
                    v-if="index !== bcList.length - 1"
                    class="font-bold hover:text-blue-500"
                    :href="item.href"
                    @click.prevent="transit(item.href)"
                    >{{ item.title }}</a
                >
                <!-- 最後の要素は現在の画面を指すため文字列とする -->
                <span v-else class="font-bold">
                    {{ item.title }}
                </span>
                <span v-if="index !== bcList.length - 1"> > </span>
            </span>
        </h3>
    </div>
</template>

<script>
import Router from "../../../router/router";

export default {
    props: {
        // パンくずリストのリストデータ { title: string, href?: string}
        bcList: Object,
    },
    methods: {
        transit(href) {
            Router.push(href);
        },
    },
};
</script>
