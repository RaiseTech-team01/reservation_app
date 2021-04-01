# == Schema Information
#
# Table name: store_discount_info_notifications
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_store_discount_info_notifications_on_store_id  (store_id)
#  index_store_discount_info_notifications_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe StoreDiscountInfoNotification, type: :model do
  context "必要な情報が揃っている場合" do
    let(:store_discount_info_notification) { build(:store_discount_info_notification) }

    it "店舗割引情報通知できる" do
      expect(store_discount_info_notification).to be_valid
    end
  end
end
