# == Schema Information
#
# Table name: deliveries
#
#  id         :bigint           not null, primary key
#  deliverer  :string(255)
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
FactoryBot.define do
  factory :deliverie do
    deliverer { "MyString" }
    user { nil }
    store { nil }
  end
end
