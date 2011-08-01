require 'test_helper'

class DiscussionsControllerTest < ActionController::TestCase
  setup do
    @discussion = discussions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discussions)
  end

  test "should get new" do
    get :new
    assert_redirected_to new_discussion_path
  end

  test "should show discussion" do
    get :show, :id => @discussion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @discussion.to_param
    assert_response :success
  end

  test "should update discussion" do
    put :update, :id => @discussion.to_param, :discussion => @discussion.attributes
    assert_redirected_to discussion_path(assigns(:discussion))
  end

  test "should destroy discussion" do
    assert_difference('Discussion.count', -1) do
      delete :destroy, :id => @discussion.to_param
    end

    assert_redirected_to discussions_path
  end

  test "should create discussion" do
    assert_difference('Discussion.count') do
#      @discussion.posts = posts(:one).attributes
      post :create, :discussion => @discussion
    end

    assert_redirected_to discussions_path
  end

#  test "should create unicode discussion" do
#    assert_difference('Discussion.count') do
#      post :create, :discussion => posts(:unicode).attributes
#    end

#    assert_redirected_to discussions_path
#  end
end
