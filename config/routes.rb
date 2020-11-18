Rails.application.routes.draw do
  get 'contact', to:'home#contact'
  get 'post_view/postview'
  resources :posts
  root 'home#home'
  #root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
