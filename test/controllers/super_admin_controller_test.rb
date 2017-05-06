require 'test_helper'

class SuperAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get super_admin_index_url
    assert_response :success
  end

end
