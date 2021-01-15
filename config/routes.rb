Rails.application.routes.draw do
  # root 'welcome#index'

   devise_scope :user do
    root 'devise/sessions#new' 
  end

  resources :products
  resources :categories
  resources :transactions, only: [:new, :create]
  resource :profile
  resources :orders
  resources :states, only: :index
  resources :addresses , only: [:index] do
    post :preferred
  end
  #get "/new_orders" => "orders#new"
  get "/add_address" => "addresses#add_address", :as => :add_address
  get "/product_list" => "products#product_list", :as => :product_list
  #post "/orders" => "orders#create_orders", :as => :create_orders

   post "/hook" => "regstrations#hook"

 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
#  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }




end
