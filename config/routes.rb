Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/support'
  get 'pages/foods'
  get 'pages/drinks'
  get 'pages/purchased_orders'
  get 'admin/dashboard'
  get 'admin/warehouse'
  get 'admin/reportlist' 

  devise_for :users
  
  scope "/admin" do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  
  resources :products do
    resources :cart_items
    resources :reviews
  end
  
  resources :carts, only: [:show] do
    resources :cart_items, except: [:update]
  end
  
  resources :orders

  patch "cart/cart_item" => "cart_items#update"
  patch "cart-update" => "carts#update"
  get '/products/:id/details', to: 'products#details', as:'product-details'
end