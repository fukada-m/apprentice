Rails.application.routes.draw do
  get 'api/users', to: 'api#register'
  post 'api/users/login', to: 'api#login'

  get '/get', to: 'todo#get'
  post '/todos', to: 'todo#create'
  get '/todos', to: 'todo#index'
  put 'todos/:id', to: 'todo#update'
  delete 'todos/:id', to: 'todo#destroy'
  root "todo#test"

end
