require 'test_helper'

class Floors::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get floors_rooms_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get floors_rooms_controller_create_url
    assert_response :success
  end

end
