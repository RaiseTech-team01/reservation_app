class Api::V1::BaseApiController < ApplicationController
  alias_method :current_user, :current_api_v1_user
  alias_method :authenticate_user!, :authenticate_api_v1_user!
  alias_method :user_signed_in?, :api_v1_user_signed_in?

  # development のみ rails 例外処理表示
  if Rails.env.production? || Rails.env.test?
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  def record_not_found
    render json: { error: "指定したページは存在しません", status: "404" }, status: :not_found
  end
end
