Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'posts#index'
  resources :posts do
    resources :comments 
  end
  resources :tags
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  put 'post/like/:id', to: 'posts#like', as: 'like'
end
