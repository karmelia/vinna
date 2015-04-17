Rails.application.routes.draw do
  root 'posts#index'

  get 'about', to: 'about#index'

  resources :posts do 
    resources :comments
  end

  resources :users

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
