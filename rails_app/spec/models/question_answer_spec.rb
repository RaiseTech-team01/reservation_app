# == Schema Information
#
# Table name: question_answers
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#
# Indexes
#
#  index_question_answers_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
require "rails_helper"

RSpec.describe QuestionAnswer, type: :model do
  context "必要な情報が揃っている場合" do
    let(:question_answer) { build(:question_answer) }

    it "Q & A が登録できる" do
      expect(question_answer).to be_valid
    end
  end
end
