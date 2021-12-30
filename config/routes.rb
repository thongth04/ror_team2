Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/support'
  get 'pages/foods'
  get 'pages/drinks'
  get 'admin/dashboard'

  devise_for :users
  
  scope "/admin" do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  
  resources :products do
    resources :cart_items
  end
  get '/products/details/:id', to: 'products#details', as:'product-details'
  
  resources :carts do
    resources :cart_items
  end
  
  resources :orders
  get 'warehouses/index'
  get 'warehouses/products'
end