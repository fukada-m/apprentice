Rails.application.routes.draw do
  get '/get', to: 'todo#get'
  post '/todos', to: 'todo#create'
  get '/todos', to: 'todo#index'
  put 'todos/:id', to: 'todo#update'
  delete 'todos/:id', to: 'todo#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "todo#test"
  # Defines the root path route ("/")
  # root "articles#index"
end
