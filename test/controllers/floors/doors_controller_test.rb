require 'test_helper'

class Floors::DoorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get floors_doors_new_url
    assert_response :success
  end

  test "should get create" do
    get floors_doors_create_url
    assert_response :success
  end

end
