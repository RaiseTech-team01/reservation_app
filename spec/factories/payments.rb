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
FactoryBot.define do
  factory :payment do
    # ...
    reservation
  end
end
