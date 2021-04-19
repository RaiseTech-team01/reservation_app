Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth", controllers: {
        registrations: "api/v1/auth/registrations",
        sessions: "api/v1/auth/sessions",
      }

      mount_devise_token_auth_for "Store", at: "store_auth", controllers: {
        registrations: "api/v1/store_auth/registrations",
        sessions: "api/v1/store_auth/sessions",
      }

      namespace :reversion do
        resources :registrations, only: [:create, :destroy]
      end
    end
  end
end
