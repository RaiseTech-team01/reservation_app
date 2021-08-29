# == Schema Information
#
# Table name: question_answers
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#
# Indexes
#
#  index_question_answers_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
FactoryBot.define do
  factory :question_answer do
    title { Faker::Blockchain::Ethereum.address }
    body { Faker::String.random }

    store
  end
end
