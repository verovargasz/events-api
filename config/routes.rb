Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index, :show, :create ]
    end
  end
end
