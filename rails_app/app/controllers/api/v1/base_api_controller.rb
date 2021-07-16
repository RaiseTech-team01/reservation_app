class Api::V1::BaseApiController < ApplicationController
  alias_method :current_user, :current_api_v1_user
  alias_method :authenticate_user!, :authenticate_api_v1_user!
  alias_method :user_signed_in?, :api_v1_user_signed_in?

  alias_method :current_store, :current_api_v1_store
  alias_method :authenticate_store!, :authenticate_api_v1_store!
  alias_method :store_signed_in?, :api_v1_store_signed_in?
end
