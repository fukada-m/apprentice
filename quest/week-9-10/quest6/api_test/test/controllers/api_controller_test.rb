require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get api_get_url
    assert_response :success
  end
end
