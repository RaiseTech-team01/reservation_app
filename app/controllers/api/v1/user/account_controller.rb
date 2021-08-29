module Api::V1
  class User::AccountController < BaseApiController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user, { only: [:index, :edit] }
    def index
    end

    def edit
    end
  end
end
