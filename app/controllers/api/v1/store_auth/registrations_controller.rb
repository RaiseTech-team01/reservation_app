class Api::V1::StoreAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :verify_authenticity_token

  private

    def sign_up_params
      params.permit(:name, :email, :furigana, :tel, :fax, :postal_code, :address, :url,
                    :seat, :restaurant, :genre, :responsible_party, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :furigana, :tel, :fax,
                    :postal_code, :address, :url, :seat, :restaurant, :genre, :responsible_party)
    end
end
