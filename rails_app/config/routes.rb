Rails.application.routes.draw do
  root to: "home#top"

  get "home/top", to: "home#top"
  get "/sign_up", to: "home#top"
  get "/sign_up_confirm", to: "home#top"
  get "/sign_up_complete", to: "home#top"
  get "/login", to: "home#top"
  get "/account_info", to: "home#top"

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

      namespace :store do
        resources :store do
          resources :reservations
        end
      end
    end
  end
end
