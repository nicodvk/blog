Rails.application.routes.draw do
  root to: 'posts#index'
  resources :comments
  resources :posts
  resources :tags
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
end
