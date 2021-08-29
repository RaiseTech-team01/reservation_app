# == Schema Information
#
# Table name: question_answers
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
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
class QuestionAnswer < ApplicationRecord
  belongs_to :store

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
end
