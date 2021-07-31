class UserStore < ApplicationRecord
  belong_to :user
  belong_to :store
end
