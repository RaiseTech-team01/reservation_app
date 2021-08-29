# == Schema Information
#
# Table name: word_mouths
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  visit_day  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_word_mouths_on_store_id  (store_id)
#  index_word_mouths_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :word_mouth do
    visit_day { Faker::Date.between(from: "2021-03-23", to: "2121-09-25") }
    title { Faker::Blockchain::Ethereum.address }
    body { Faker::String.random }

    user
    store
  end
end
