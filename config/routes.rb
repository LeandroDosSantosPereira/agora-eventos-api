Rails.application.routes.draw do
 
  mount_devise_token_auth_for 'User', at: 'auth' 

  mount_devise_token_auth_for 'Admin', at: 'admin/auth'

  as :admin do
  end

  # Definindo rota de health check
  get "up" => "rails/health#show", as: :rails_health_check
end
