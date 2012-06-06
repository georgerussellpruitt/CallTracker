require 'test_helper'

class RecreateCallTypesControllerTest < ActionController::TestCase
  setup do
    @recreate_call_type = recreate_call_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recreate_call_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recreate_call_type" do
    assert_difference('RecreateCallType.count') do
      post :create, recreate_call_type: @recreate_call_type.attributes
    end

    assert_redirected_to recreate_call_type_path(assigns(:recreate_call_type))
  end

  test "should show recreate_call_type" do
    get :show, id: @recreate_call_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recreate_call_type
    assert_response :success
  end

  test "should update recreate_call_type" do
    put :update, id: @recreate_call_type, recreate_call_type: @recreate_call_type.attributes
    assert_redirected_to recreate_call_type_path(assigns(:recreate_call_type))
  end

  test "should destroy recreate_call_type" do
    assert_difference('RecreateCallType.count', -1) do
      delete :destroy, id: @recreate_call_type
    end

    assert_redirected_to recreate_call_types_path
  end
end
