Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'pages#about'
  root 'pages#about'
end
