Rails.application.routes.draw do
  devise_for :users
  get 'tops/index'
  get 'tops/show'

  root to: "tops#index"
end
