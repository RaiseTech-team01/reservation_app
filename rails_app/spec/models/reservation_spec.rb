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
require "rails_helper"

RSpec.describe Reservation, type: :model do
  context "必要な情報が揃っている場合" do
    let(:reservation) { build(:reservation) }

    it "予約登録ができる" do
      expect(reservation).to be_valid
    end
  end
end
