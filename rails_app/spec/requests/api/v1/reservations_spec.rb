require "rails_helper"

# rubocop:disable Metrics/BlockLength, RSpec/NestedGroups, RSpec/RepeatedExampleGroupBody
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

        context "指定店舗の予約一覧を表示する時" do # rubocop:disable RSpec/MultipleMemoizedHelpers
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
          it "予約一覧表示できない" do
            # TODO
          end
        end
      end
    end
  end

  describe "[予約詳細表示のテスト] GET /api/v1/store/:store_id/reservations/:id" do
    subject { get(api_v1_store_reservations_path(store_id, id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      describe "正常系" do
        # sign_in
        let(:headers) { current_user.create_new_auth_token }

        context "指定店舗の予約があり詳細を選択した時" do
          let!(:reservation) { create(:reservation, user: current_user, store_id: store_id) }

          it "予約詳細画面が確認できる" do
            # TODO
          end
        end
      end

      describe "異常系" do
        context "ログインユーザでない時" do
          it "予約詳細表示できない" do
            # TODO
          end
        end

        context "指定店舗の指定した詳細が存在していない時" do
          it "Not found, status 404が返ってくる" do
            # TODO
          end
        end
      end
    end
  end

  describe "[予約登録のテスト] POST /api/v1/store/:store_id/reservations/" do
    subject { post(api_v1_store_reservations_path(store_id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗が存在していて予約する時" do
        it "予約する事ができる" do
          # TODO
        end
      end

      context "指定店舗が存在しない時" do
        it "予約する事ができない" do
          # TODO
        end
      end
    end
  end

  describe "[予約更新のテスト] PATCH /api/v1/store/:store_id/reservations/:id" do
    subject { patch(api_v1_store_reservations_path(store_id, id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗の存在する予約を更新しようとした時" do
        it "予約詳細を更新できる" do
          # TODO
        end
      end

      context "指定店舗が存在しない時" do
        it "Not found, status 404が返ってくる" do
          # TODO
        end
      end
    end
  end

  describe "[予約取り消しのテスト] DELETE /api/v1/store/:store_id/reservations/:id" do
    subject { delete(api_v1_store_reservations_path(store_id, id), headers: headers) }

    context "ユーザーと、店舗を作成" do
      let(:current_user) { create(:user) }

      let(:store) { create(:store) }
      let(:store_id) { store.id }

      context "指定店舗の存在する予約を取り消そうとした時" do
        it "予約取り消しができる" do
          # TODO
        end
      end

      context "指定店舗が存在しない時" do
        it "Not found, status 404が返ってくる" do
          # TODO
        end
      end

      context "指定店舗の存在しない予約を削除しようとした時" do
        it "Not found, status 404が返ってくる" do
          # TODO
          # "store_id": "1",
          # "status": 404,
          # "messege": "申し訳ありません。指定した予約データは存在しません"
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, RSpec/NestedGroups, RSpec/RepeatedExampleGroupBody
