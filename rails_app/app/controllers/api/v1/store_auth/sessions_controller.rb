class Api::V1::StoreAuth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :verify_authenticity_token
end
