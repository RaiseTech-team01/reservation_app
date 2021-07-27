<template>
    <div class="main m-0">
        <dir class="storeheader m-0 text-center">
            <StoreHeader />
        </dir>
        <div class="container">
            <main>
                <div class="mt-5 py-5 text-center">
                    <h2>店舗アカウント登録</h2>
                    <p class="lead">
                        お客様の店舗用のアカウントを作成いたします。<br />情報の登録をお願いいたします。
                    </p>
                </div>
                <div class="row g-5 flex justify-center">
                    <div class="col-md-7 col-lg-8">
                        <div class="col-12 alert alert-danger" v-show="hasError()">
                            <p>{{errorMessage}}</p>
                        </div>
                        <form class="row g-3 needs-validation" novalidate>
                            <div class="col-12">
                                <label for="firstName" class="form-label"
                                    >名前
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control was-validated"
                                    id="storeName"
                                    placeholder="居酒屋 太平洋"
                                    v-model="storeData.name"
                                    required
                                />
                                <div class="invalid-feedback">
                                    名前を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="firstName" class="form-label"
                                    >ふりがな
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="storeName"
                                    placeholder="いざかや たいへいよう"
                                    v-model="storeData.furigana"
                                    required
                                />
                                <div class="invalid-feedback">
                                    ふりがなを記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label"
                                    >メールアドレス
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    placeholder="you@example.com"
                                    v-model="storeData.email"
                                    required
                                />
                                <div class="invalid-feedback">
                                    有効なメールアドレスを記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="password" class="form-label"
                                    >パスワード
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    minlength="6"
                                    v-model="storeData.password"
                                    required
                                />
                                <div class="invalid-feedback">
                                    パスワード（6文字以上）を入力してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="password-confirm" class="form-label"
                                    >パスワード（確認）
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="password"
                                    class="form-control"
                                    id="password-confirm"
                                    minlength="6"
                                    v-model="storeData.password_confirmation"
                                    required
                                />
                                <div class="invalid-feedback">
                                    パスワード（6文字以上）を入力してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="tel" class="form-label"
                                    >電話番号
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="tel"
                                    class="form-control"
                                    id="tel"
                                    placeholder="080-1111-222"
                                    v-model="storeData.tel"
                                    required
                                />
                                <div class="invalid-feedback">
                                    電話番号を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="fax" class="form-label"
                                    >FAX番号
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="tel"
                                    class="form-control"
                                    id="fax"
                                    placeholder="03-4444-5555"
                                    v-model="storeData.fax"
                                    required
                                />
                                <div class="invalid-feedback">
                                    FAX番号を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="postal-code" class="form-label"
                                    >郵便番号
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="number"
                                    class="form-control"
                                    id="postal-code"
                                    placeholder="1110043"
                                    v-model="storeData.postal_code"
                                    required
                                />
                                <div class="invalid-feedback">
                                    郵便番号を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="address" class="form-label"
                                    >店舗住所
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="address"
                                    placeholder="東京都台東区駒形1-1"
                                    v-model="storeData.address"
                                    required
                                />
                                <div class="invalid-feedback">
                                    店舗の所在地を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="store-url" class="form-label"
                                    >店舗URL
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="url"
                                    class="form-control"
                                    id="store-url"
                                    placeholder="http://izakaya.com/iroha"
                                    v-model="storeData.url"
                                    required
                                />
                                <div class="invalid-feedback">
                                    店舗のURLを記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="store-name" class="form-label"
                                    >店舗名
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="store-name"
                                    placeholder="いろは駅前店"
                                    v-model="storeData.restaurant"
                                    required
                                />
                                <div class="invalid-feedback">
                                    店舗名を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="sear-num" class="form-label"
                                    >座席数
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="number"
                                    class="form-control"
                                    id="sear-num"
                                    placeholder="100"
                                    v-model="storeData.seat"
                                    required
                                />
                                <div class="invalid-feedback">
                                    座席数を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="genre" class="form-label"
                                    >業態
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="genre"
                                    placeholder="飲食業"
                                    v-model="storeData.genre"
                                    required
                                />
                                <div class="invalid-feedback">
                                    業態を記載してください。
                                </div>
                            </div>
                            <div class="col-12">
                                <label
                                    for="responsible-party"
                                    class="form-label"
                                    >責任者名
                                    <span class="text-muted">必須</span></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="responsible-party"
                                    placeholder="担当者A"
                                    v-model="storeData.responsible_party"
                                    required
                                />
                                <div class="invalid-feedback">
                                    業態を記載してください。
                                </div>
                            </div>
                            <div class="col-12 mb-5">
                                <label for="others" class="form-label"
                                    >その他</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="others"
                                    placeholder="アレルギー品目：大豆、牛乳、小麦粉"
                                    v-model="storeData.other"
                                />
                                <div class="invalid-feedback">
                                    追記する情報がありましたら記載してください。
                                </div>
                            </div>
                            <div class="text-center">
                                <button
                                    type="submit"
                                    class="m-3 px-5 btn btn-primary btn-lg btn-block"
                                >
                                    登録確認
                                </button>
                                <button
                                    type="button"
                                    class="m-3 px-5 btn btn-outline-primary btn-lg btn-block"
                                    @click.prevent="back"
                                >
                                    戻　る
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 2017–2021 Company Name</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">Privacy</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Support</a></li>
                </ul>
            </footer>
        </div>
    </div>
</template>

<script>
import Router from "../../router/router";
import StoreHeader from "../layout/StoreHeader.vue";

export default {
    data: function() {
        return {
            errorMessage: "",
            storeData: {
                name: "",
                email: "",
                furigana: "",
                tel: "",
                fax: "",
                postal_code: "",
                url: "",
                address: "",
                seat: "",
                restaurant: "",
                genre: "",
                responsible_party: "",
                other: "",
                password: "",
                password_confirmation: ""
            }
        };
    },

    components: {
        StoreHeader
    },

    methods: {
        hasError() {
            return !!this.errorMessage
        },
        goToAccountConfirm() {
            Router.push("/store_account_confirm");
        },
        back() {
            Router.back();
        },
        appendBootstrapScriptTag() {
            let linkEl = document.createElement("link");
            linkEl.setAttribute(
                "href",
                "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
            );
            linkEl.setAttribute("rel", "stylesheet");
            linkEl.setAttribute(
                "integrity",
                "sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
            );
            linkEl.setAttribute("crossorigin", "anonymous");
            document.head.appendChild(linkEl);
        },
        initializeValidation(validatedCallback) {
            const instance0 = this;
            this.$nextTick(function() {
                console.log(this);
                const instance = this;
                //("use strict");

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll(".needs-validation");

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach(function(form) {
                    form.addEventListener(
                        "submit",
                        function(event) {
                            if (!form.checkValidity()) {
                                console.log("invalid");
                                event.preventDefault();
                                event.stopPropagation();
                            } else {
                                console.log("valid");
                                console.log("instance:");
                                console.log(instance);
                                console.log("instance0:");
                                console.log(instance0);
                                event.preventDefault();
                                event.stopPropagation();
                                console.log(this);

                                validatedCallback();
                            }
                            form.classList.add("was-validated");
                        },
                        false
                    );
                });
            });
        }
    },
    mounted() {
        this.appendBootstrapScriptTag();
        this.initializeValidation(() => {
            console.log("success validation")

            this.$store.dispatch('registrationStoreUserData/update', this.storeData)
            this.goToAccountConfirm();
        });
        this.errorMessage = this.$store.getters.registrationStoreUserData.errs
    }
};
</script>

<style scoped src="../../../assets/stylesheets/offcanvas.css"></style>
<style scoped>
p {
    font-size: 1.0rem;
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
