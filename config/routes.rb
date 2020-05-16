Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'about', to: 'pages#about'
  root 'pages#about'
end
