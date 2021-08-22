# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reservation_id :bigint
#
# Indexes
#
#  index_payments_on_reservation_id  (reservation_id)
#
# Foreign Keys
#
#  fk_rails_...  (reservation_id => reservations.id)
#
class Payment < ApplicationRecord
  belongs_to :store
  belongs_to :user

  has_many :deliveries, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
