require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buildings_new_url
    assert_response :success
  end

  test "should get create" do
    get buildings_create_url
    assert_response :success
  end

end
