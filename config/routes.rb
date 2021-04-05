Rails.application.routes.draw do
  devise_for :users
  root to: 'urls#index'
  resources :urls, only: [:index, :create, :destroy]
  get ':short_url', to: 'urls#go'
end
