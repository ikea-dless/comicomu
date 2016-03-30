Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks' }
  get 'tops/index'
  get 'tops/show'

  root to: 'tops#index'
end
