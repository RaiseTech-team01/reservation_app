Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  root to: "home#top"

  get "home/top", to: "home#top"
  get "/sign_up", to: "home#top"
  get "/sign_up_confirm", to: "home#top"
  get "/sign_up_complete", to: "home#top"
  get "/login", to: "home#top"
  get "/account_info", to: "home#top"
  get "/account_edit", to: "home#top"
  get "/reservation_form", to: "home#top"
  get "/reservation_confirm", to: "home#top"
  get "/reservation_complete", to: "home#top"
  get "/reservation_list", to: "home#top"
  get "/reservation_detail", to: "home#top"
  get "/reservation_history", to: "home#top"
  get "/reservation_view_history", to: "home#top"
  get "/reservation_edit", to: "home#top"
  get "/store_login", to: "home#top"
  get "/store_reservation_list", to: "home#top"
  get "/store_account_form", to: "home#top"
  get "/store_account_confirm", to: "home#top"
  get "/store_user_list", to: "home#top"
  get "/store_dash_board", to: "home#top"
  get "/store_settings", to: "home#top"

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

      resources :store do
        resources :reservations
      end
    end
  end
end
