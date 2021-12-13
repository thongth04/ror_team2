Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/support'
  get 'pages/foods'
  get 'pages/drinks'
  # get 'pages/cart'
  # get 'pages/pay'
  # get 'pages/warehouse'
  # get 'pages/invoice'
  get 'product-details', to: 'pages#product_details'

  devise_for :users
  
  scope "/admin" do
    resources :users, only: [:index, :edit, :update, :destroy]
    
  end
  
  resources :products do
    resources :cart_items
  end

  resources :carts do
    resources :cart_items
  end

end