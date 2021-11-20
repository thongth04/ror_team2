Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/support'
  get 'pages/food'
  get 'pages/drink'
  get 'pages/giohang'
  get 'pages/pay'
  
  devise_for :users

  get 'admins/index'
  get 'admins/manage_users'

end
