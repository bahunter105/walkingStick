Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: %i[show]
  resources :walks, only: [:show, :index] do
    resources :landmarks, only: [:show, :index]
  end

  get '/dashboard', to: 'pages#dashboard'
  get '/walks/:walk_id/:landmark_order_no', to: 'walks#navigate'
end
