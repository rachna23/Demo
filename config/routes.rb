Rails.application.routes.draw do
  resources :transactions, only: [:new, :create]
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resource :profile

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
