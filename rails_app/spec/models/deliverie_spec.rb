# == Schema Information
#
# Table name: deliveries
#
#  id         :bigint           not null, primary key
#  deliverer  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_deliveries_on_store_id  (store_id)
#  index_deliveries_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Deliverie, type: :model do
  context "必要な情報が揃っている場合" do
    let(:deliverie) { build(:deliverie) }

    it "デリバリー配達手配がsできる" do
      binding.pry
      expect(deliverie).to be_valid
    end
  end
end
