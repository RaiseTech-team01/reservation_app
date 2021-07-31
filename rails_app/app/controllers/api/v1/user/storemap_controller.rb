module Api::V1
  class User::StoremapController < BaseApiController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user, { only: [:show] }

    def show
      # 目的地のmap_url
      storemap = Storemap.find(params[:store_id])
      render json: storemap, serializer: Api::V1::StoremapSerializer
    end
  end
end
