require "rails_helper"

RSpec.describe "Api::V1::StoreAuth::Sessions", type: :request do # rubocop:disable Metrics/BlockLength
  describe "POST /api/v1/store_auth/sign_in" do # rubocop:disable Metrics/BlockLength
    subject { post(api_v1_store_session_path, params: params) }

    context "登録してるアカウントでログインした時" do
      # """ storeを生成して, 登録store で login 認証している """
      let(:store) { create(:store) }
      let(:params) { attributes_for(:store, email: store.email, password: store.password) }

      it "ログインできる" do
        subject
        header = response.header
        expect(header["access-token"]).to be_present
        expect(header["client"]).to be_present
        expect(header["uid"]).to be_present
        expect(response).to have_http_status(:ok)
      end
    end

    context "別 store: 登録されていないアカウントでログインした時" do
      let(:store) { create(:store) }
      let(:params) { attributes_for(:store) }

      it "ログインできない" do
        subject
        res = JSON.parse(response.body)
        # expect(res["errors"]).to include "Invalid login credentials. Please try again."
        expect(res["errors"]).to include "ログイン用の認証情報が正しくありません。再度お試しください。"

        header = response.header
        expect(header["access-token"]).to be_blank
        expect(header["client"]).to be_blank
        expect(header["uid"]).to be_blank
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "登録されたアカウント: passowrd が違う値でログインするとき" do
      let(:store) { create(:store) }
      let(:params) { attributes_for(:store, email: store.email, password: "xxxxx") }

      it "ログインできない" do
        subject
        res = JSON.parse(response.body)
        # expect(res["errors"]).to include "Invalid login credentials. Please try again."
        expect(res["errors"]).to include "ログイン用の認証情報が正しくありません。再度お試しください。"

        header = response.header
        expect(header["access-token"]).to be_blank
        expect(header["client"]).to be_blank
        expect(header["uid"]).to be_blank
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "登録したアカウント: 登録していない email でログインした時" do
      let(:store) { create(:store) }
      let(:params) { attributes_for(:store, email: "xxx@xx.com", password: store.password) }

      it "ログインできない" do
        subject
        res = JSON.parse(response.body)
        # expect(res["errors"]).to include "Invalid login credentials. Please try again."
        expect(res["errors"]).to include "ログイン用の認証情報が正しくありません。再度お試しください。"

        header = response.header
        expect(header["access-token"]).to be_blank
        expect(header["client"]).to be_blank
        expect(header["uid"]).to be_blank
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE /api/v1/store_auth/sign_out" do
    subject { delete(destroy_api_v1_store_session_path, headers: headers) }

    context "auth token store がログアウトする時" do
      let(:store) { create(:store) }
      let!(:headers) { store.create_new_auth_token }

      it "トークンを無くし、ログアウトできる" do
        expect { subject }.to change { store.reload.tokens }.from(be_present).to(be_blank)
        expect(response).to have_http_status(:ok)
      end
    end

    context "auth tokenが付与されていない状態で, 送信した時" do
      let(:store) { create(:store) }
      let!(:token) { store.create_new_auth_token }
      # 明示的に空にしたことを書く
      let!(:headers) { { "access-token" => "", "token-type" => "", "client" => "", "expiry" => "", "uid" => "" } }
      # 同じ結果にはなる
      # let!(:headers) { {} }

      it "存在しないエラー" do
        subject
        res = JSON.parse(response.body)
        # expect(res["errors"]).to include "store was not found or was not logged in."
        expect(res["errors"]).to include "ユーザーが見つからないか、ログインしていません。"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
