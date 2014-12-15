Rails.application.routes.draw do
  get   '/tags',        to: 'tags#index'
  get   '/tag/:slug',   to: 'tags#show'
  post  '/tag/:slug',   to: 'tags#destroy'

  resources :comments
end
