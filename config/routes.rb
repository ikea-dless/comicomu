Rails.application.routes.draw do
  resources :posts do
    resource :favorite, module: 'fpost', only: [:show, :update, :destroy]
    resource :comments
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
  get 'tops/index'
  get 'tops/show'
  get 'tops/about'

  root to: 'tops#index'
end
