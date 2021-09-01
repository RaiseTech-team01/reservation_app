<template>
  <div class="flex justify-center">
    <div class="info-container">
      <main>
        <div class="mt-5 py-5 text-center">
          <h2>予約登録</h2>
        </div>
        <div class="row g-5 mb-4 flex justify-center">
          <div class="col-md-7 col-lg-8">
            <div class="col-12 p-2 alert alert-danger" v-show="hasError()">
              <p
                class="fs-6 m-0"
                v-for="(e, index) in errorMessage"
                :key="index"
              >
                {{ e }}
              </p>
            </div>
            <form class="row g-3 needs-validation" novalidate>
              <div class="col-12">
                <label for="storeName" class="form-label"
                  >店舗名 <span class="text-muted">必須</span></label
                >
                <select
                  id="storeName"
                  class="form-select"
                  aria-label="Default select example"
                  v-model="userData.gender"
                  required
                >
                  <option selected disabled value="">選択...</option>
                  <option value="渋谷駅前店">渋谷駅前店</option>
                  <option value="新宿駅前店">新宿駅前店</option>
                  <option value="品川駅前店">品川駅前店</option>
                </select>
                <div class="invalid-feedback">店舗を選択してください。</div>
              </div>
              <div class="col-12">
                <label for="reserveDate" class="form-label"
                  >予約日 <span class="text-muted">必須</span></label
                >
                <v-date-picker
                  v-model="reservationInputData.date"
                  mode="date"
                  :value="null"
                  color="orange"
                  :columns="
                    $screens({
                      default: 1,
                      lg: 2,
                    })
                  "
                  :step="1"
                  :min-date="new Date()"
                  :max-date="getDateAfterMonths(2)"
                >
                  <template v-slot="{ inputValue, inputEvents }">
                    <input
                      type="text"
                      class="form-control"
                      id="address"
                      placeholder="東京都台東区駒形1-1"
                      :value="inputValue"
                      v-on="inputEvents"
                      required
                    />
                  </template>
                </v-date-picker>
                <div class="invalid-feedback">住所を記載してください。</div>
              </div>
              <div class="col-12">
                <label for="reserveTime" class="form-label"
                  >開始時刻 <span class="text-muted">必須</span></label
                >
                <div class="row">
                  <div class="col-3">
                    <select
                      v-model="reservationInputData.hour"
                      id="hours_selector"
                      class="form-select"
                      name="hours"
                      type="text"
                      required
                      @click="showTimetableCallback"
                    />
                    <div class="invalid-feedback">時を選択してください。</div>
                  </div>
                  時
                  <div class="col-3">
                    <select
                      v-model="reservationInputData.minute"
                      id="minutes_selector"
                      class="form-select"
                      name="minutes"
                      type="text"
                      required
                      @click="showTimetableCallback"
                    />
                    <div class="invalid-feedback">分を選択してください。</div>
                  </div>
                  分
                </div>
              </div>
              <div class="col-12">
                <label for="guests_number" class="form-label"
                  >ご利用人数 <span class="text-muted">必須</span></label
                >
                <div class="row">
                  <div class="col-4">
                    <input
                      type="number"
                      class="form-control"
                      id="guests_number"
                      name="guests_number"
                      min="1"
                      step="1"
                      placeholder="2"
                      v-model="reservationInputData.number_people"
                      required
                    />
                    <div class="invalid-feedback">
                      ご利用人数を入力してください。
                    </div>
                  </div>
                  名様
                </div>
              </div>
              <div class="col-12">
                <label for="price" class="form-label"
                  >ご予算 <span class="text-muted">必須</span></label
                >
                <div class="row mb-3">
                  <div class="col-4">
                    <input
                      type="number"
                      class="form-control"
                      id="price"
                      name="price"
                      min="500"
                      step="500"
                      placeholder="3000"
                      v-model="reservationInputData.budget"
                      required
                    />
                    <div class="invalid-feedback">
                      ご予算を入力してください。
                    </div>
                  </div>
                  円
                </div>
              </div>
              <div
                v-show="isShowPersonalInformationProtectionForm"
                class="border border-color-cyan"
              >
                <div class="checkbox mt-3 ml-2 mb-2 fs-5 text-rt-cyan">
                  <label>
                    <input
                      type="checkbox"
                      name="privacy_policy"
                      value="yes"
                      required
                    />
                    個人情報保護方針に同意する
                  </label>
                </div>
                <div class="col-12">
                  <p class="col-12 ml-2 fs-6 text-start">
                    個人情報の取扱については以下をご覧ください。
                  </p>
                </div>
                <div class="text-center">
                  <!-- Button trigger modal -->
                  <button
                    type="button"
                    class="col-5 fs-6 mb-4 btn btn-lg btn-outline-indigo"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  >
                    プライバシーポリシー
                  </button>
                </div>
              </div>
              <!-- Modal -->
              <div
                class="modal fade"
                id="exampleModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">
                        プライバシーポリシー
                      </h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      />
                    </div>
                    <div class="modal-body">
                      ＿＿＿＿＿＿＿＿（以下，「当社」といいます。）は，本ウェブサイト上で提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。
                      <br /><br />
                      <p class="fs-5">第1条（個人情報）</p>
                      「個人情報」とは，個人情報保護法にいう「個人情報」を指すものとし，生存する個人に関する情報であって，当該情報に含まれる氏名，生年月日，住所，電話番号，連絡先その他の記述等により特定の個人を識別できる情報及び容貌，指紋，声紋にかかるデータ，及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。
                      <br /><br />
                      <p class="fs-5">第2条（個人情報の収集方法）</p>
                      当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。
                      <br /><br />
                      <p class="fs-5">第3条（個人情報を収集・利用する目的）</p>
                      当社が個人情報を収集・利用する目的は，以下のとおりです。
                      当社サービスの提供・運営のため
                      ユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）
                      ユーザーが利用中のサービスの新機能，更新情報，キャンペーン等及び当社が提供する他のサービスの案内のメールを送付するため
                      メンテナンス，重要なお知らせなど必要に応じたご連絡のため
                      利用規約に違反したユーザーや，不正・不当な目的でサービスを利用しようとするユーザーの特定をし，ご利用をお断りするため
                      ユーザーにご自身の登録情報の閲覧や変更，削除，ご利用状況の閲覧を行っていただくため
                      有料サービスにおいて，ユーザーに利用料金を請求するため
                      上記の利用目的に付随する目的
                      <br /><br />
                      <p class="fs-5">第4条（利用目的の変更）</p>
                      当社は，利用目的が変更前と関連性を有すると合理的に認められる場合に限り，個人情報の利用目的を変更するものとします。
                      利用目的の変更を行った場合には，変更後の目的について，当社所定の方法により，ユーザーに通知し，または本ウェブサイト上に公表するものとします。
                      <br /><br />
                      <p class="fs-5">第5条（個人情報の第三者提供）</p>
                      当社は，次に掲げる場合を除いて，あらかじめユーザーの同意を得ることなく，第三者に個人情報を提供することはありません。ただし，個人情報保護法その他の法令で認められる場合を除きます。
                      人の生命，身体または財産の保護のために必要がある場合であって，本人の同意を得ることが困難であるとき
                      公衆衛生の向上または児童の健全な育成の推進のために特に必要がある場合であって，本人の同意を得ることが困難であるとき
                      国の機関もしくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって，本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがあるとき
                      予め次の事項を告知あるいは公表し，かつ当社が個人情報保護委員会に届出をしたとき
                      利用目的に第三者への提供を含むこと
                      第三者に提供されるデータの項目
                      第三者への提供の手段または方法
                      本人の求めに応じて個人情報の第三者への提供を停止すること
                      本人の求めを受け付ける方法
                      前項の定めにかかわらず，次に掲げる場合には，当該情報の提供先は第三者に該当しないものとします。
                      当社が利用目的の達成に必要な範囲内において個人情報の取扱いの全部または一部を委託する場合
                      合併その他の事由による事業の承継に伴って個人情報が提供される場合
                      個人情報を特定の者との間で共同して利用する場合であって，その旨並びに共同して利用される個人情報の項目，共同して利用する者の範囲，利用する者の利用目的および当該個人情報の管理について責任を有する者の氏名または名称について，あらかじめ本人に通知し，または本人が容易に知り得る状態に置いた場合
                      <br /><br />
                      <p class="fs-5">第6条（個人情報の開示）</p>
                      当社は，本人から個人情報の開示を求められたときは，本人に対し，遅滞なくこれを開示します。ただし，開示することにより次のいずれかに該当する場合は，その全部または一部を開示しないこともあり，開示しない決定をした場合には，その旨を遅滞なく通知します。なお，個人情報の開示に際しては，1件あたり1，000円の手数料を申し受けます。
                      本人または第三者の生命，身体，財産その他の権利利益を害するおそれがある場合
                      当社の業務の適正な実施に著しい支障を及ぼすおそれがある場合
                      その他法令に違反することとなる場合
                      前項の定めにかかわらず，履歴情報および特性情報などの個人情報以外の情報については，原則として開示いたしません。
                      <br /><br />
                      <p class="fs-5">第7条（個人情報の訂正および削除）</p>
                      ユーザーは，当社の保有する自己の個人情報が誤った情報である場合には，当社が定める手続きにより，当社に対して個人情報の訂正，追加または削除（以下，「訂正等」といいます。）を請求することができます。
                      当社は，ユーザーから前項の請求を受けてその請求に応じる必要があると判断した場合には，遅滞なく，当該個人情報の訂正等を行うものとします。
                      当社は，前項の規定に基づき訂正等を行った場合，または訂正等を行わない旨の決定をしたときは遅滞なく，これをユーザーに通知します。
                      <br /><br />
                      <p class="fs-5">第8条（個人情報の利用停止等）</p>
                      当社は，本人から，個人情報が，利用目的の範囲を超えて取り扱われているという理由，または不正の手段により取得されたものであるという理由により，その利用の停止または消去（以下，「利用停止等」といいます。）を求められた場合には，遅滞なく必要な調査を行います。
                      前項の調査結果に基づき，その請求に応じる必要があると判断した場合には，遅滞なく，当該個人情報の利用停止等を行います。
                      当社は，前項の規定に基づき利用停止等を行った場合，または利用停止等を行わない旨の決定をしたときは，遅滞なく，これをユーザーに通知します。
                      前2項にかかわらず，利用停止等に多額の費用を有する場合その他利用停止等を行うことが困難な場合であって，ユーザーの権利利益を保護するために必要なこれに代わるべき措置をとれる場合は，この代替策を講じるものとします。
                      <br /><br />
                      <p class="fs-5">第9条（プライバシーポリシーの変更）</p>
                      本ポリシーの内容は，法令その他本ポリシーに別段の定めのある事項を除いて，ユーザーに通知することなく，変更することができるものとします。
                      当社が別途定める場合を除いて，変更後のプライバシーポリシーは，本ウェブサイトに掲載したときから効力を生じるものとします。
                      <br /><br />
                      <p class="fs-5">第10条（お問い合わせ窓口）</p>
                      本ポリシーに関するお問い合わせは，下記の窓口までお願いいたします。
                      住所： 社名： 担当部署： Eメールアドレス：
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                      >
                        Close
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center" v-show="isShowButton">
                <button
                  type="button"
                  class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
                  v-show="isShowButton1"
                  v-bind:value="confirmButtonTitle"
                  @click.prevent="confirmButtonCallback(reservationInputData)"
                >
                  登録確認
                </button>
                <button
                  type="button"
                  class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
                  v-show="isShowButton2"
                  v-bind:value="cancelButtonTitle"
                  @click.prevent="cancelButtonCallback"
                >
                  戻　る
                </button>
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>
<script>
import BreadClumbList from "../commons/layouts/BreadClumbList.vue"

export default {
  data: function () {
    return {
      errorMessage: "",
      reservationInputData: {
        date: new Date(),
        hour: "",
        minute: "",
        number_people: "",
        // menu:"",
        budget: "",
        // inquiry:"",
      },
      date: new Date(),
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: this.subTitle,
        },
      ],
    }
  },

  components: {
    BreadClumbList,
  },

  props: {
    title: String,
    subTitle: String,
    isShowGuideNavi: Boolean,
    isShowPersonalInformationProtectionForm: Boolean,
    confirmButtonTitle: String,
    confirmButtonCallback: Function,
    cancelButtonTitle: String,
    cancelButtonCallback: Function,
    showTimetableCallback: Function,
  },
  methods: {
    hasError() {
      return this.errorMessage.length !== 0
    },
    convertTwoDigit(value) {
      return ("0" + value).slice(-2)
    },
    addOption(select, value) {
      if (select.childNodes.length > 0) {
        select.removeChild(select.firstChild)
      }
      let option = document.createElement("option")
      option.setAttribute("value", value)
      option.innerHTML = value
      select.appendChild(option)
    },
    setTime(hours, minutes) {
      const hoursSel = document.getElementById("hours_selector")
      this.addOption(hoursSel, this.convertTwoDigit(hours))

      const minutesSel = document.getElementById("minutes_selector")
      this.addOption(minutesSel, this.convertTwoDigit(minutes))

      this.reservationInputData.hour = this.convertTwoDigit(hours)
      this.reservationInputData.minute = this.convertTwoDigit(minutes)
    },
    getDateAfterMonths(month) {
      let date = new Date()
      return date.setMonth(date.getMonth() + month)
    },
  },
  computed: {
    isShowButton() {
      return (
        this.confirmButtonTitle !== undefined ||
        this.cancelButtonTitle !== undefined
      )
    },
    isShowButton1() {
      return this.confirmButtonTitle !== undefined
    },
    isShowButton2() {
      return this.cancelButtonTitle !== undefined
    },
  },
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/customize.css"></style>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.radiox {
  transform: scale(2, 2);
}
</style>
