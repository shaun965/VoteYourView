require 'test_helper'

class VoteDetailsControllerTest < ActionController::TestCase
  setup do
    @vote_detail = vote_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_detail" do
    assert_difference('VoteDetail.count') do
      post :create, vote_detail: {  }
    end

    assert_redirected_to vote_detail_path(assigns(:vote_detail))
  end

  test "should show vote_detail" do
    get :show, id: @vote_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_detail
    assert_response :success
  end

  test "should update vote_detail" do
    patch :update, id: @vote_detail, vote_detail: {  }
    assert_redirected_to vote_detail_path(assigns(:vote_detail))
  end

  test "should destroy vote_detail" do
    assert_difference('VoteDetail.count', -1) do
      delete :destroy, id: @vote_detail
    end

    assert_redirected_to vote_details_path
  end
end
