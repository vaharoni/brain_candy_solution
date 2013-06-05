require 'test_helper'

class BrainCandiesControllerTest < ActionController::TestCase
  setup do
    @brain_candy = brain_candies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brain_candies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brain_candy" do
    assert_difference('BrainCandy.count') do
      post :create, brain_candy: { name: @brain_candy.name }
    end

    assert_redirected_to brain_candy_path(assigns(:brain_candy))
  end

  test "should show brain_candy" do
    get :show, id: @brain_candy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brain_candy
    assert_response :success
  end

  test "should update brain_candy" do
    put :update, id: @brain_candy, brain_candy: { name: @brain_candy.name }
    assert_redirected_to brain_candy_path(assigns(:brain_candy))
  end

  test "should destroy brain_candy" do
    assert_difference('BrainCandy.count', -1) do
      delete :destroy, id: @brain_candy
    end

    assert_redirected_to brain_candies_path
  end
end
