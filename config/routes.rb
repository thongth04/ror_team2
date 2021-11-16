Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/support'
  get 'pages/food'
  get 'pages/drink'
  get 'pages/giohang'
  
  devise_for :users
end
