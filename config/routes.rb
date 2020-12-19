Rails.application.routes.draw do
  root 'welcome#index'
  resources :products
  resources :categories
  resources :transactions, only: [:new, :create]
  resource :profile
  resources :orders
  #get "/new_orders" => "orders#new"
  #get "/orders" => "orders#index", :as => :orders
  #post "/orders" => "orders#create_orders", :as => :create_orders

   post "/hook" => "regstrations#hook"

  devise_for :users
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"



end
