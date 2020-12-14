Rails.application.routes.draw do
  resources :issues
  resources :posts
  resources :users

  get 'contact', to:'home#contact'

  post 'request_contact', to:'home#request_contact'
  post 'get_user', to:'home#get_user'

  root 'home#home'
end
