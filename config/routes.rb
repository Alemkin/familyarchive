FamilyArchive::Application.routes.draw do

  root to: 'pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/allusers' => 'users#all'
  delete '/deleteuser' => 'users#destroy'
  get '/edituser' => 'users#edit'
  patch '/updateuser' => 'users#update'

  get '/generic' => 'pages#generic'
  get '/index' => 'pages#index'

  get '/newartifact' => 'artifacts#new'
  post '/createartifact' => 'artifacts#create'
  get '/editartifact' => 'artifacts#edit'
  patch '/updateartifact' => 'artifacts#update'
  delete '/deleteartifact' => 'artifacts#destroy'

  get '/forbidden' => 'application#forbidden'
end
