Rails.application.routes.draw do
  
  get "home/top" => "home#top"

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth", controllers: {
        registrations: "api/v1/auth/registrations",
        sessions: "api/v1/auth/sessions",
      }
    end
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "Store", at: "store_auth", controllers: {
        registrations: "api/v1/store_auth/registrations",
        sessions: "api/v1/store_auth/sessions",
      }
    end
  end
end
