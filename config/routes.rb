Rails.application.routes.draw do
  devise_for :users
  resources :quotes

  root 'pages#home'
end
