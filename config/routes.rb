Rails.application.routes.draw do
  
  root 'pages#home'
  
  get 'pages/introduce'
  get 'pages/trogiup'

end
