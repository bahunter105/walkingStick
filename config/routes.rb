Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/walks/:walk_id/completed/:user_id', to: 'walks#completed', as: :completed
  get '/walks/:walk_id/:landmark_order_no', to: 'walks#navigate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show]

  resources :walks, only: [:show, :index] do
    resources :landmarks, only: [:show, :index]
  end
end
