# == Schema Information
#
# Table name: deliveries
#
#  id         :bigint           not null, primary key
#  deliverer  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_deliveries_on_store_id  (store_id)
#  index_deliveries_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class Deliverie < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :deliverer, presence: true, length: { maximum: 3 }
end
