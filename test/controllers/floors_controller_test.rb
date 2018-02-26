require 'test_helper'

class FloorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get floors_new_url
    assert_response :success
  end

  test "should get create" do
    get floors_create_url
    assert_response :success
  end

end
