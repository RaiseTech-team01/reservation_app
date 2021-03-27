class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  binding.pry
  skip_before_action :verify_authenticity_token
end
