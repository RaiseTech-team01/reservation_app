# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :payment do
    # ...
  end
end
