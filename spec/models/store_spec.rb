# == Schema Information
#
# Table name: stores
#
#  id                     :bigint           not null, primary key
#  address                :string(255)
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  fax                    :string(255)
#  furigana               :string(255)
#  genre                  :string(255)
#  name                   :string(255)
#  other                  :string(255)
#  postal_code            :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  responsible_party      :string(255)
#  restaurant             :string(255)
#  seat                   :integer
#  tel                    :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  url                    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_stores_on_confirmation_token    (confirmation_token) UNIQUE
#  index_stores_on_email                 (email) UNIQUE
#  index_stores_on_reset_password_token  (reset_password_token) UNIQUE
#  index_stores_on_uid_and_provider      (uid,provider) UNIQUE
#
require "rails_helper"

RSpec.describe Store, type: :model do # rubocop:disable Metrics/BlockLength
  describe "バリテーションのテスト" do # rubocop:disable Metrics/BlockLength
    describe "正常系" do # rubocop:disable Metrics/BlockLength
      context "必要な情報が揃っている場合" do
        let(:store) { build(:store) }

        it "店舗登録ができる" do
          expect(store).to be_valid
        end
      end

      context "名前入力が50文字以下の時" do
        let(:store) { build(:store, name: "a" * 50) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "フリガナが100文字以下の時" do
        let(:store) { build(:store, furigana: "a" * 100) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "電話番号が21文字以下の時" do
        let(:store) { build(:store, tel: ("1" * 21).to_i) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "FAX番号が21文字以下の時" do
        let(:store) { build(:store, fax: ("1" * 21).to_i) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "郵便番号が7文字以下の時" do
        let(:store) { build(:store, postal_code: ("1" * 7).to_i) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "座席数が3桁以下の時" do
        let(:store) { build(:store, seat: ("9" * 3).to_i) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "レストランが50文字以下の時" do
        let(:store) { build(:store, restaurant: "a" * 50) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "ジャンルが50文字以下の時" do
        let(:store) { build(:store, genre: "a" * 50) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end

      context "責任者が50文字以下の時" do
        let(:store) { build(:store, responsible_party: "a" * 50) }

        it "店舗登録できる" do
          expect(store).to be_valid
        end
      end
    end

    describe "異常系" do # rubocop:disable Metrics/BlockLength
      context "名前が入力されていない時" do
        let(:store) { build(:store, name: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "名前入力が51文字以上の時" do
        let(:store) { build(:store, name: "a" * 51) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "フリガナが入力されていない時" do
        let(:store) { build(:store, furigana: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "フリガナが101文字以上の時" do
        let(:store) { build(:store, furigana: "a" * 101) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "電話番号が22文字以上の時" do
        let(:store) { build(:store, tel: ("1" * 22).to_i) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "電話番号が入力されていない時" do
        let(:store) { build(:store, tel: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "FAX番号が22文字以上の時" do
        let(:store) { build(:store, fax: ("1" * 22).to_i) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "郵便番号がが入力されていない時" do
        let(:store) { build(:store, postal_code: nil) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "郵便番号が8文字以上の時" do
        let(:store) { build(:store, postal_code: ("1" * 8).to_i) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "住所が入力されていない時" do
        let(:store) { build(:store, address: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "URLが入力されていない時" do
        let(:store) { build(:store, url: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "座席数が入力されていない時" do
        let(:store) { build(:store, seat: nil) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "座席数が4桁以上の時" do
        let(:store) { build(:store, seat: 1000) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "レストランが入力されていない時" do
        let(:store) { build(:store, restaurant: nil) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "レストランが51文字以上の時" do
        let(:store) { build(:store, restaurant: "a" * 51) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "ジャンルが入力されていない時" do
        let(:store) { build(:store, genre: nil) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "ジャンルが51文字以上の時" do
        let(:store) { build(:store, genre: "a" * 51) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "責任者が51文字以上の時" do
        let(:store) { build(:store, responsible_party: "a" * 51) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "責任者が入力されていない時" do
        let(:store) { build(:store, responsible_party: nil) }

        it "店舗登録できない" do
          expect(store).not_to be_valid
        end
      end

      context "email が入力されていない時" do
        let(:store) { build(:store, email: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end

      context "password が入力されていない時" do
        let(:store) { build(:store, password: nil) }

        it "店舗登録ができない" do
          expect(store).not_to be_valid
        end
      end
    end
  end
end
