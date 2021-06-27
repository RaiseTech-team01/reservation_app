class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :verify_authenticity_token
  before_action :check_token

  private

    def check_token
      if request.headers["access-token"].present? || request.headers["uid"].present? || request.headers["client"].present? 
        render json: { errors: { title: '既にログインしています', detail: 'ユーザー登録は行われています。' } }, status: 400
      end
    end

    def sign_up_params
      params.permit(:name, :email, :furigana, :tel, :birthday, :gender, :address, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :furigana, :tel, :birthday, :gender, :address)
    end
end
