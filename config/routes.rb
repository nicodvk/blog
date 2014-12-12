Rails.application.routes.draw do
  get '/tags',      to: 'tags#index'
  get '/tag/:id',   to: 'tags#show'
  get '/tag',       to: 'tags#new'
  post '/tag',      to: 'tags#create'
  post '/tag/:id',  to: 'tags#destroy'
end
