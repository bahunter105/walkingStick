Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :walks, only: [:show, :index] do
    resources :landmarks, only: [:show, :index]
  end
end
