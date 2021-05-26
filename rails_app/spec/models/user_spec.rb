# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string(255)
#  allow_password_change  :boolean          default(FALSE)
#  birthday               :string(255)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  furigana               :string(255)
#  gender                 :string(255)
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  tel                    :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require "rails_helper"

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe "バリテーションのテスト" do
    describe "正常系" do
      context "必要な情報が揃っている場合" do
        let(:user) { build(:user) }

        it "ユーザー登録できる" do
          expect(user).to be_valid
        end
      end

      context "名前入力が50文字以下の時" do
        let(:user) { build(:user, name: "a" * 50) }

        it "ユーザー登録できる" do
          expect(user).to be_valid
        end
      end

      context "フリガナが100文字以下の時" do
        let(:user) { build(:user, furigana: "a" * 100) }

        it "ユーザー登録できる" do
          expect(user).to be_valid
        end
      end

      context "電話番号が21文字以下の時" do
        let(:user) { build(:user, tel: ("1" * 21).to_i) }

        it "ユーザー登録できる" do
          expect(user).to be_valid
        end
      end

      context "生年月日が10文字以下の時" do
        let(:user) { build(:user, birthday: ("1" * 10).to_i) }

        it "ユーザー登録できる" do
          expect(user).to be_valid
        end
      end
    end

    describe "異常系" do
      context "名前が入力されていない時" do
        let(:user) { build(:user, name: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "名前入力が51文字以上の時" do
        let(:user) { build(:user, name: "a" * 51) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "フリガナが入力されていない時" do
        let(:user) { build(:user, furigana: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "フリガナが101文字以上の時" do
        let(:user) { build(:user, furigana: "a" * 101) }

        it "ユーザー登録できない" do
          expect(user).not_to be_valid
        end
      end

      context "電話番号が22文字以上の時" do
        let(:user) { build(:user, tel: ("1" * 22).to_i) }

        it "ユーザー登録できない" do
          expect(user).not_to be_valid
        end
      end

      context "email が入力されていない時" do
        let(:user) { build(:user, email: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "password が入力されていない時" do
        let(:user) { build(:user, password: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "電話番号が入力されていない時" do
        let(:user) { build(:user, tel: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "生年月日が入力されていない時" do
        let(:user) { build(:user, birthday: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end

      context "生年月日が11文字以上の時" do
        let(:user) { build(:user, birthday: ("1" * 11).to_i) }

        it "ユーザー登録できない" do
          expect(user).not_to be_valid
        end
      end

      context "性別が入力されていない時" do
        let(:user) { build(:user, gender: nil) }

        it "ユーザー登録ができない" do
          expect(user).not_to be_valid
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
