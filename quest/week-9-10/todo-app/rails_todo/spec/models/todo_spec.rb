require 'rails_helper'

RSpec.describe Todo, type: :model do
    it "タイトルが空だった場合バリデーションエラー" do
    todo = Todo.new(title: nil)
    todo.valid?
    expect(todo.errors[:title]).to include("を入力してください")
  end

  it "タイトルが入力されていた場合バリデーションエラーにならない" do
    todo = Todo.new(title: "宿題")
    expect(todo).to be_valid
  end
end
