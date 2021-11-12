Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/food'
  get 'pages/drink'


end
