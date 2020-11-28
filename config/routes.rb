Rails.application.routes.draw do
  resources :posts
  resources :users
  root 'home#home'
  get 'contact', to:'home#contact'
  post 'request_contact', to:'home#request_contact'
  get 'post_view/postview'
  #root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
