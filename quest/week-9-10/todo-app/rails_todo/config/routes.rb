Rails.application.routes.draw do
  root 'todo#index'
  get 'todo/index' => 'todo#index'
  get 'todo/new' => 'todo#new'
  post 'todo/create' => 'todo#create'
  post 'todo/:id/delete' => 'todo#delete'
  get 'todo/delete' => 'todo#delete'
  get 'todo/:id/edit' => 'todo#edit'
  post 'todo/:id/update' =>'todo#update'
end
