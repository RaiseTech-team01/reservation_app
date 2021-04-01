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
FactoryBot.define do
  factory :store_discount_info_notification do
    title { Faker::Job.employment_type }
    body { "MyText" }

    user
    store
  end
end
