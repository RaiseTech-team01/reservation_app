require "rails_helper"

RSpec.describe "Api::V1::StoreAuth::Registrations", type: :request do # rubocop:disable Metrics/BlockLength
  describe "POST /api/v1/store_auth" do # rubocop:disable Metrics/BlockLength
    subject { post(api_v1_store_registration_path, params: params) }

    context "新規登録 response header 情報が確認できた時" do
      # """ 正確な header 情報（トークン）のレスポンスを確認する """

      let(:params) { attributes_for(:store) }

      it "新規登録ができる" do
        subject
        header = response.header
        expect(header["access-token"]).to be_present
        expect(header["token-type"]).to be_present
        expect(header["client"]).to be_present
        expect(header["expiry"]).to be_present
        expect(header["uid"]).to eq params[:email]
        expect(response).to have_http_status(:ok)
      end
    end

    context "新規登録するStore情報が正しい時" do
      # """ このテストはただ, リクエスト情報の確認をしてるだけ """
      let(:params) { attributes_for(:store, password: 123_456, password_confirmation: 123_456) }

      it "新規登録ができる" do
        subject
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(res["data"]["id"]).to eq Store.last.id
        expect(res["data"]["email"]).to eq Store.last.email
        expect(res["data"]["name"]).to eq params[:name]
      end
    end

    context "新規登録するStoreのpass認証が違う時" do
      let(:params) { attributes_for(:store, password: 123_456, password_confirmation: 123_457) }

      it "do Error" do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "新規登録するStoreのEmailがすでに登録されている時" do
      let!(:store) { create(:store, email: "Exsample@xxx.com") }
      let(:params) { attributes_for(:store, email: "Exsample@xxx.com") }

      it "do Error" do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
