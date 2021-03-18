# == Schema Information
#
# Table name: reservations
#
#  id                 :bigint           not null, primary key
#  budget             :integer
#  date_at            :string(255)
#  date_on            :string(255)
#  inquiry            :text(65535)
#  menu               :string(255)
#  number_people      :integer
#  reservation_number :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  store_id           :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_reservations_on_store_id  (store_id)
#  index_reservations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :store
end
