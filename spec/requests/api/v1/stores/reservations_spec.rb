require "rails_helper"

# TODO: fix test
# rubocop:disable Metrics/BlockLength, RSpec/NestedGroups, RSpec/MultipleMemoizedHelpers
RSpec.describe "Api::V1::Stores::Reservations", type: :request do
  xdescribe "[店舗 予約一覧表示のテスト] GET /api/v1/stores/reservations" do
    subject { get(api_v1_stores_reservations_path, headers: headers) }

    context "店舗とユーザーを作成" do
      let(:current_store) { create(:store) }
      let(:current_user) { create(:user) }

      describe "正常系" do
        let(:headers) { current_store.create_new_auth_token }

        context "自店舗の予約がない時" do
          it "一覧表示を空で返す" do
            subject
            res = JSON.parse(response.body)
            expect(res.length).to eq 0
            expect(response).to have_http_status(:ok)
          end
        end

        context "自店舗の予約一がある時" do
          # 予約を
          let!(:reservation1) { create(:reservation, store_id: current_store.id, user: current_user, updated_at: 1.days.ago) }
          let!(:reservation2) { create(:reservation, store_id: current_store.id, user: current_user, updated_at: 2.days.ago) }
          let!(:reservation3) { create(:reservation, store_id: current_store.id, user: current_user) }

          it "自店舗の予約一覧を表示する事ができる" do
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

        context "ユーザが他店舗で予約した時" do
          # 予約を生成
          let(:current_store2) { create(:store) }

          let!(:reservation) { create(:reservation, store_id: current_store2.id, user: current_user) }

          it "自店舗の予約一覧に表示されない" do
            subject
            res = JSON.parse(response.body)

            expect(res.length).to eq 0
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe "異常系" do
        context "ログイン店舗ユーザでない時" do
          # 予約を生成
          let(:current_store2) { create(:store) }
          let!(:reservation) { create(:reservation, store_id: current_store2.id, user: current_user) }

          it "認証されず、予約一覧表示がみれない" do
            subject

            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, RSpec/NestedGroups, RSpec/MultipleMemoizedHelpers
