require 'test_helper'

class ManagementShiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @management_shift = management_shifts(:one)
  end

  test "should get index" do
    get management_shifts_url
    assert_response :success
  end

  test "should get new" do
    get new_management_shift_url
    assert_response :success
  end

  test "should create management_shift" do
    assert_difference('ManagementShift.count') do
      post management_shifts_url, params: { management_shift: {  } }
    end

    assert_redirected_to management_shift_url(ManagementShift.last)
  end

  test "should show management_shift" do
    get management_shift_url(@management_shift)
    assert_response :success
  end

  test "should get edit" do
    get edit_management_shift_url(@management_shift)
    assert_response :success
  end

  test "should update management_shift" do
    patch management_shift_url(@management_shift), params: { management_shift: {  } }
    assert_redirected_to management_shift_url(@management_shift)
  end

  test "should destroy management_shift" do
    assert_difference('ManagementShift.count', -1) do
      delete management_shift_url(@management_shift)
    end

    assert_redirected_to management_shifts_url
  end
end
