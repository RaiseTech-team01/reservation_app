# == Schema Information
#
# Table name: word_mouths
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  visit_day  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_word_mouths_on_store_id  (store_id)
#  index_word_mouths_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe WordMouth, type: :model do
  context "必要な情報が揃っている場合" do
    let(:word_mouth) { build(:word_mouth) }

    it "クチコミできる" do
      expect(word_mouth).to be_valid
    end
  end
end
