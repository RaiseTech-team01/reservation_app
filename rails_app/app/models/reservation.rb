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
require "securerandom"

class Reservation < ApplicationRecord
  # TODO: payment 外部キー nilを許可して良いか
  belongs_to :payment, optional: true
  belongs_to :store
  belongs_to :user

  validates :date_at, presence: true
  validates :date_on, presence: true
  validates :number_people, presence: true, length: { maximum: 3 }
  validates :menu, presence: true, length: { maximum: 50 }
  validates :budget, presence: true, length: { maximum: 6 }
  validates :reservation_number, presence: true, length: { maximum: 12 }

  def self.search_store(store)
    where(store: store)
  end

  def create_reservation_num
    SecureRandom.hex(6)
  end
end
