Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Admin', at: 'admin/auth'

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :events
      end
    end
  end

  # Definindo rota de health check
  get "up" => "rails/health#show", as: :rails_health_check
end
