class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :store

  has_many :store, dependent: :destroy
  has_many :deliveries, dependent: :destroy
end
