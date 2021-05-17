# == Schema Information
#
# Table name: reservations
#
#  id                 :bigint           not null, primary key
#  budget             :integer
#  date_at            :datetime
#  date_on            :datetime
#  inquiry            :text(65535)
#  menu               :string(255)
#  number_people      :integer
#  reservation_number :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  payment_id         :bigint
#  store_id           :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_reservations_on_payment_id  (payment_id)
#  index_reservations_on_store_id    (store_id)
#  index_reservations_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_id => payments.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :reservation do
    date_at { Faker::Date.between(from: "2021-03-23", to: "2121-09-25") }
    date_on { Faker::Date.between(from: "2021-03-23", to: "2121-09-25") }
    number_people { Faker::Number.number(digits: 3) }
    menu { Faker::Food.dish }
    budget { Faker::Number.number(digits: 6) }
    inquiry { "MyText" }
    reservation_number { Faker::String.random(length: 12) }

    # association :user, factory: :user の略
    user
    store
  end
end
