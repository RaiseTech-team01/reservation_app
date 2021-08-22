class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  # ログインしていない場合はログインページへ
  def authenticate_user
    if current_user.nil?
      redirect_to("/login")
    end
  end
end
