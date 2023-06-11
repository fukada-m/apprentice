class TodoController < ApplicationController
  def index
    @todos = Todo.all
  end
  
  def new
    
  end
  
  def create
    @todo = Todo.new(title: params[:title])
    if (@todo.save)
      redirect_to("/todo/index")
    else
      flash[:notice] = @todo.errors.full_messages
      redirect_to("/todo/new")
    end
    
  end
  
  def edit
    @todo = Todo.find_by(id: params[:id])
  end
  
  def update
    @todo = Todo.find_by(id: params[:id])
    @todo.update(title: params[:title])
    redirect_to("/todo/index")
  end
  
  def delete
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to("/todo/index")
  end
  
end
