class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :verify_authenticity_token

  private

    # binding.pry
    def sign_up_params
      binding.pry
      params.permit(:name, :email, :furigana, :tel, :birthday, :password, :password_confirmation)
    end

    def account_update_params
      binding.pry
      params.permit(:name, :email, :furigana, :tel, :birthday)
    end
end
