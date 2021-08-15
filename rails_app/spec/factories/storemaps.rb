# == Schema Information
#
# Table name: storemaps
#
#  id         :bigint           not null, primary key
#  url        :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :string(255)
#
FactoryBot.define do
  factory :storemap do
    url { "MyString" }
  end
end
