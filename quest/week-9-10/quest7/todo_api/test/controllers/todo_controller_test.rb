require "test_helper"

class TodoControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get todo_get_url
    assert_response :success
  end
end
