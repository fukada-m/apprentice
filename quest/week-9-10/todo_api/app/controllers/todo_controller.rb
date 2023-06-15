class TodoController < ApplicationController
  before_action :authenticate_user, {only: [:index, :update, :delete] }
  skip_before_action :verify_authenticity_token

  def get
    render json: {status: "success"}
  end
  
  def create
    @request = params.require(:todo).permit(:title)
    @todo = Todo.new(@request)
    if @todo.save
      render json: { 
        todo: {
          id: @todo.id, 
          title: @todo.title
        }
      }, status: :created
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def index
    @todos = Todo.all
    render json: {
      todos: @todos.map do |todo|
        {id: todo.id, title: todo.title}
      end      
    }
  end
  
  def update
    @todo = Todo.find_by(id: params[:id])
    if @todo.update(params.require(:todo).permit(:title)) 
      render json: { 
        todo: {
          id: @todo.id, 
          title: @todo.title
        }
      }, status: :ok
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @todo = Todo.find_by(id: params[:id])
    if @todo.destroy
      head :no_content
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # postメソッドのテスト用
  def test
  end
end

