Rails.application.routes.draw do
  resources :user_questions
  resources :categories
  resources :questions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
