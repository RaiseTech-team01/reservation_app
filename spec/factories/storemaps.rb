# == Schema Information
#
# Table name: storemaps
#
#  id         :bigint           not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :string
#
FactoryBot.define do
  factory :storemap do
    url { "MyString" }
  end
end
