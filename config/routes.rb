FamilyArchive::Application.routes.draw do

  root to: 'pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/generic' => 'pages#generic'
  get '/index' => 'pages#index'

end
