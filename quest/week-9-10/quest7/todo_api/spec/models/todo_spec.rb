require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "タイトルが空だった場合バリデーションエラー" do
    todo = Todo.new(title: nil)
    todo.valid?
    expect(todo.errors[:title]).to include("can't be blank")
  end

end
