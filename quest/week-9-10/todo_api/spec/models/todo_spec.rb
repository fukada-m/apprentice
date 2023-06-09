require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "タイトルが空だった場合バリデーションエラー" do
    todo = FactoryBot.build(:todo, title: nil)
    todo.valid?
    expect(todo.errors[:title]).to include("can't be blank")
  end

  it "タイトルが入力されていた場合バリデーションエラーにならない" do
    todo = FactoryBot.build(:todo)
    expect(todo).to be_valid
  end
end
