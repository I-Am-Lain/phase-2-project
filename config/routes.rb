Rails.application.routes.draw do
  resources :user_questions
  resources :categories
  resources :questions
  resources :users do
    resources :themes, only: [:show, :new, :create, :index]
  end
  resources :themes, only: [:index]
  resources :theme_categories


  get '/game', to: 'game#options'
  get '/play', to: 'game#play'
  
  post '/game', to: 'game#accept_options', as: '/accept_options'

  
  patch '/cart', to: 'cart#update', as: 'add_to_cart'
  get '/login', to: 'sessions#new'
  get 'signup', to: 'users#new', as: 'signup'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
