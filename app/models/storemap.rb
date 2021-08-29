# == Schema Information
#
# Table name: storemaps
#
#  id         :bigint           not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :string
#
class Storemap < ApplicationRecord
  belongs_to :store
end
