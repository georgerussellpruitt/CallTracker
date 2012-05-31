require 'test_helper'

class CallLocationsControllerTest < ActionController::TestCase
  setup do
    @call_location = call_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:call_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create call_location" do
    assert_difference('CallLocation.count') do
      post :create, call_location: @call_location.attributes
    end

    assert_redirected_to call_location_path(assigns(:call_location))
  end

  test "should show call_location" do
    get :show, id: @call_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @call_location
    assert_response :success
  end

  test "should update call_location" do
    put :update, id: @call_location, call_location: @call_location.attributes
    assert_redirected_to call_location_path(assigns(:call_location))
  end

  test "should destroy call_location" do
    assert_difference('CallLocation.count', -1) do
      delete :destroy, id: @call_location
    end

    assert_redirected_to call_locations_path
  end
end
