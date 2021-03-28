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
#  seat                   :string(255)
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

RSpec.describe Store, type: :model do
  context "必要な情報が揃っている場合" do
    let(:store) { build(:store) }

    it "店舗登録ができる" do
      expect(store).to be_valid
    end
  end
end
