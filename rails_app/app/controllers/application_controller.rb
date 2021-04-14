class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include SessionsHelper
  protect_from_forgery with: :null_session

  private
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
