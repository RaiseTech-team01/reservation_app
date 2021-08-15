Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  root to: "home#top"

  get "home/top", to: "home#top"
  get "/sign_up", to: "home#top"
  get "/sign_up_confirm", to: "home#top"
  get "/sign_up_complete", to: "home#top"
  get "/login", to: "home#top"

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

      namespace :user do
        # account_controller
        resources :account, only: [:index, :edit]

        get "/account_info", to: "account#index", at:  :account_info
        get "/account_edit", to: "account#index", at:  :account_edit

        # reservation_controller
        resources :reservations, param: :store_id, only: [:index, :show, :create, :update, :destroy]
          get "/reservations/:store_id/:id", to: "reservations#show", at: :reservation_detail
        

        # vueRoutePath
        get "/reservation_form", to: "reservations#index", at:  :reservation_form
        get "/reservation_confirm", to: "reservations#index", at: :reservation_confirm
        get "/reservation_complete", to: "reservations#index", at: :reservation_complete
        get "/reservation_list", to: "reservations#index", at: :reservation_list
        get "/reservation_detail", to: "reservations#index", at: :reservation_detail
        get "/reservation_history", to: "reservations#index", at:  :reservation_history
        get "/reservation_view_history", to: "reservations#index", at: :reservation_view_history
        get "/reservation_edit", to: "reservations#index", at: :reservation_edit

        # store_map
        resources :storemaps, param: :store_id, only: [:show]
      end

      namespace :stores do
        resources :reservations
      end
    end
  end
end
