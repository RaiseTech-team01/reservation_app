# == Schema Information
#
# Table name: calendars
#
#  id              :bigint           not null, primary key
#  body            :text(65535)
#  business_hours  :string(255)
#  regular_holiday :string(255)
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  store_id        :bigint           not null
#
# Indexes
#
#  index_calendars_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
require "rails_helper"

RSpec.describe Calendar, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
