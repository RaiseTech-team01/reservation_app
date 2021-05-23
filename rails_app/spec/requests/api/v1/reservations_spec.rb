require "rails_helper"

# rubocop:disable Metrics/BlockLength, RSpec/NestedGroups, RSpec/MultipleMemoizedHelpers
RSpec.describe "Api::V1::Reservations", type: :request do
  describe "[予約一覧表示のテスト] GET /api/v1/store/:store_id/reservations" do
    subject { get(api_v1_store_reservations_path(store_id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      describe "正常系" do
        # sign_in
        let(:headers) { current_user.create_new_auth_token }

        context "指定店舗の予約がない時" do
          it "一覧表示を空で返す" do
            subject
            res = JSON.parse(response.body)
            expect(res.length).to eq 0
            expect(response).to have_http_status(:ok)
          end
        end

        context "指定店舗の予約一覧を表示する時" do
          # 予約を生成
          let!(:reservation1) { create(:reservation, user: current_user, store_id: store_id, updated_at: 1.days.ago) }
          let!(:reservation2) { create(:reservation, user: current_user, store_id: store_id, updated_at: 2.days.ago) }
          let!(:reservation3) { create(:reservation, user: current_user, store_id: store_id) }

          it "指定店舗の予約一覧を表示する事ができる" do
            subject
            res = JSON.parse(response.body)

            expect(res.length).to eq 3
            expect(res.map {|d| d["id"] }).to eq [reservation1.id, reservation2.id, reservation3.id]
            expect(res[0].keys).to eq ["id", "date_at", "date_on", "number_people", "menu", "budget",
                                       "inquiry", "reservation_number", "store", "user"]
            # 返り値
            expect(res[0]["user"].keys).to eq ["id", "name", "furigana", "email", "tel", "gender", "address", "image"]
            expect(res[0]["store"].keys).to eq ["id", "name", "furigana", "email", "tel", "fax", "postal_code", "address", "url", "seat"]

            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe "異常系" do
        context "ログインユーザでない時" do
          # 予約を生成
          let!(:reservation) { create(:reservation, store_id: store_id) }

          it "認証されず、予約一覧表示がみれない" do
            subject
            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end

  describe "[予約詳細表示のテスト] GET /api/v1/store/:store_id/reservations/:id" do
    subject { get(api_v1_store_reservation_path(store_id, reservation_id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }
      # sign_in
      let(:headers) { current_user.create_new_auth_token }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      describe "正常系" do
        context "指定店舗の指定予約がある時" do
          # 予約生成
          let(:reservation) { create(:reservation, user: current_user, store_id: store_id, date_on: "15:00:00") }
          let(:reservation_id) { reservation.id }
          # ex) "2044-09-01"
          let(:date_at) { 0..9 }
          # ex) 15:00:00
          let(:date_on) { 11..18 }

          it "予約詳細が確認できる" do # rubocop:disable RSpec/ExampleLength
            subject
            res = JSON.parse(response.body)

            expect(res.keys).to eq ["id", "date_at", "date_on", "number_people", "menu", "budget",
                                    "inquiry", "reservation_number", "store", "user"]
            expect(res["id"]).to eq reservation.id
            expect(res["date_at"][date_at]).to eq reservation.date_at.to_s[date_at]
            expect(res["date_on"][date_on]).to eq reservation.date_on.to_s[date_on]
            expect(res["number_people"]).to eq reservation.number_people
            expect(res["menu"]).to eq reservation.menu
            expect(res["budget"]).to eq reservation.budget
            expect(res["inquiry"]).to eq reservation.inquiry
            expect(res["reservation_number"]).to eq reservation.reservation_number

            expect(res["store"]["name"]).to eq store.name
            expect(res["store"]["email"]).to eq store.email
            expect(res["store"]["tel"]).to eq store.tel
            expect(res["store"]["fax"]).to eq store.fax

            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe "異常系" do
        context "指定店舗の指定予約がない時" do
          let(:reservation) { create(:reservation, user: current_user, store_id: store_id) }
          let(:reservation_id) { reservation.id.to_i + 1 }

          it "予約データが存在しない例外処理が実行される" do
            subject
            expect(response).to have_http_status(:not_found)

            res = JSON.parse(response.body)
            expect(res["store_id"]).to eq store_id.to_s
            expect(res["status"]).to eq 404
            expect(res["messege"]).to eq "申し訳ありません。指定した予約データは存在しません"
          end
        end
      end
    end
  end

  describe "[予約登録のテスト] POST /api/v1/store/:store_id/reservations/" do
    subject { post(api_v1_store_reservations_path(store_id), params: params, headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }
      let(:headers) { current_user.create_new_auth_token }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗が存在していて予約する時" do
        let(:params) { { reservation: attributes_for(:reservation, date_on: "15:00:00") } }
        # ex) "2044-09-01"
        let(:date_at) { 0..9 }
        # ex) 15:00:00
        let(:date_on) { 11..18 }

        it "予約する事ができる" do # rubocop:disable RSpec/ExampleLength
          expect { subject }.to change { Reservation.count }.by(1)
          res = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)

          expect(res.keys).to eq ["id", "date_at", "date_on", "number_people", "menu", "budget",
                                  "inquiry", "reservation_number", "store", "user"]
          expect(res["date_at"][date_at]).to eq params[:reservation][:date_at].to_s
          expect(res["date_on"][date_on]).to eq params[:reservation][:date_on].to_s
          expect(res["number_people"]).to eq params[:reservation][:number_people]
          expect(res["menu"]).to eq params[:reservation][:menu]
          expect(res["budget"]).to eq params[:reservation][:budget]
          expect(res["inquiry"]).to eq params[:reservation][:inquiry]
          expect(res["reservation_number"].length).to eq 12
        end
      end

      context "指定店舗が存在しない時" do
        let(:params) { { reservation: attributes_for(:reservation) } }
        let(:store_id) { store.id.to_i + 1 }

        # REVIEW: 例外メッセージが不適切。「店舗が存在しません」としたい
        it "指定店舗が存在しない例外処理が実行される" do
          subject
          expect(response).to have_http_status(:not_found)

          res = JSON.parse(response.body)
          expect(res["store_id"]).to eq store_id.to_s
          expect(res["status"]).to eq 404
          expect(res["messege"]).to eq "申し訳ありません。指定した予約データは存在しません"
        end
      end
    end
  end

  describe "[予約更新のテスト] PATCH /api/v1/store/:store_id/reservations/:id" do
    subject { patch(api_v1_store_reservation_path(store_id, reservation_id), params: params, headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }
      let(:headers) { current_user.create_new_auth_token }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗の存在する予約を更新しようとした時" do
        # 予約する
        let(:params) { { reservation: attributes_for(:reservation), store_id: store_id, reservation_id: reservation_id } }

        # 更新する
        let(:reservation) { create(:reservation, user: current_user, store_id: store_id) }
        let(:reservation_id) { reservation.id }

        it "予約詳細を更新できる" do
          expect { subject }.to change { reservation.reload.number_people }.from(reservation.number_people).to(params[:reservation][:number_people]) &
                                change { reservation.reload.menu }.from(reservation.menu).to(params[:reservation][:menu]) &
                                change { reservation.reload.budget }.from(reservation.budget).to(params[:reservation][:budget]) &
                                change { reservation.reload.inquiry }.from(reservation.inquiry).to(params[:reservation][:inquiry]) &
                                not_change { reservation.reload.reservation_number } &
                                not_change { reservation.reload.store_id } &
                                not_change { reservation.reload.created_at }
        end
      end
    end
  end

  describe "[予約取り消しのテスト] DELETE /api/v1/store/:store_id/reservations/:id" do
    subject { delete(api_v1_store_reservation_path(store_id, reservation_id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }
      let(:headers) { current_user.create_new_auth_token }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗の予約が存在していてキャンセルしたい時" do
        # 予約生成
        let!(:reservation) { create(:reservation, user: current_user, store_id: store_id) }
        let(:reservation_id) { reservation.id }

        it "予約をキャンセルできる" do
          expect { subject }.to change { Reservation.count }.by(-1)
          # 204 No Content
          expect(response).to have_http_status(:no_content)
        end
      end

      context "ログインしたuserが他のuserの記事を削除しようとする時" do
        # 他のログインしたuserで記事作成
        let(:other_user) { create(:user) }
        let!(:reservation) { create(:reservation, user: other_user, store_id: store_id) }
        let(:reservation_id) { reservation.id.to_i + 1 }

        it "予約をキャンセルできない" do
          subject
          expect(response).to have_http_status(:not_found)

          res = JSON.parse(response.body)
          expect(res["store_id"]).to eq store_id.to_s
          expect(res["status"]).to eq 404
          expect(res["messege"]).to eq "申し訳ありません。指定した予約データは存在しません"
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, RSpec/NestedGroups, RSpec/MultipleMemoizedHelpers
