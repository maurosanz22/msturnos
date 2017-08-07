require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shift_new_url
    assert_response :success
  end

  test "should get create" do
    get shift_create_url
    assert_response :success
  end

end
