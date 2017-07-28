Rails.application.routes.draw do

  root 'static_pages#home'

  get 'session/new', to: 'session#new'
  post 'session/new', to: 'session#create', as: :login
  delete 'session/logout', to: 'session#destroy', as: :logout

  resources :posts

  # resources :users
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: :new_user
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  get '/users/:id', to: 'users#show', as: :user
  # put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
