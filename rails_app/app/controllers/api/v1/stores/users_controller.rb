module Api::V1
  class Stores::UsersController < BaseApiController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_store!

    def index
      users = current_store.users
      render json: users, each_serializer: Api::V1::UserSerializer
    end
  end
end
