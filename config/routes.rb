Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/introduce'
  get 'pages/trogiup'
  get 'pages/giohang'
  get 'pages/food'
  get 'pages/drink'

  get '/users/sign_in', to: redirect('login')
  get '/users/sign_up', to: redirect('signup')
  # get '/users/edit', to: "devise/registrations#edit"

  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do
    get    'login',  to: "devise/sessions#new",         as: :new_user_session
    post   'login',  to: "devise/sessions#create",      as: :user_session
    delete 'logout', to: "devise/sessions#destroy",     as: :destroy_user_session
 
    get    'signup',  to: "devise/registrations#new",    as: :new_user_registration
    post   'signup',  to: "devise/registrations#create", as: :user_registration
    get    '/users/edit', to: "devise/registrations#edit", as: :edit_user_registration
  end
  
end
