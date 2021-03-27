Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        mount_devise_token_auth_for "User", at: "auth", controllers: {
          registrations: "api/v1/users/auth/registrations",
          sessions: "api/v1/users/auth/sessions",
        }
      end
    end
  end

  mount_devise_token_auth_for "Store", at: "store_auth"

  as :store do
    # Define routes for Store within this block.
  end
end
