FamilyArchive::Application.routes.draw do

  root to: 'pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'  
  delete '/users/:id' => 'users#destroy'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  post '/users' => 'users#create'
  get '/users' => 'users#all'

  get '/generic' => 'pages#generic'
  get '/index' => 'pages#index'

  get '/artifacts/new' => 'artifacts#new'
  get '/artifacts/:id/edit' => 'artifacts#edit'
  patch '/artifacts/:id' => 'artifacts#update'
  delete '/artifacts/:id' => 'artifacts#destroy'
  post '/artifacts' => 'artifacts#create'

  get '/forbidden' => 'application#forbidden'
end
