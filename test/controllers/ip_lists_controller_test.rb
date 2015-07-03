require 'test_helper'

class IpListsControllerTest < ActionController::TestCase
  setup do
    @ip_list = ip_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ip_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ip_list" do
    assert_difference('IpList.count') do
      post :create, ip_list: {  }
    end

    assert_redirected_to ip_list_path(assigns(:ip_list))
  end

  test "should show ip_list" do
    get :show, id: @ip_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ip_list
    assert_response :success
  end

  test "should update ip_list" do
    patch :update, id: @ip_list, ip_list: {  }
    assert_redirected_to ip_list_path(assigns(:ip_list))
  end

  test "should destroy ip_list" do
    assert_difference('IpList.count', -1) do
      delete :destroy, id: @ip_list
    end

    assert_redirected_to ip_lists_path
  end
end
