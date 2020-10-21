Rails.application.routes.draw do
  resources :user_questions
  resources :categories
  resources :questions
  resources :users
  patch '/cart', to: 'cart#update', as: 'add_to_cart'
  
  root 'users#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
