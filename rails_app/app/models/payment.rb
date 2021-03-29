# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :store

  has_many :store, dependent: :destroy
  has_many :deliveries, dependent: :destroy
end
