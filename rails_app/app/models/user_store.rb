# == Schema Information
#
# Table name: user_stores
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_stores_on_store_id  (store_id)
#  index_user_stores_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class UserStore < ApplicationRecord
  belongs_to :user
  belongs_to :store
end
