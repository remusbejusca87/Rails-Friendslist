require "test_helper"

class FriendstablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendstable = friendstables(:one)
  end

  test "should get index" do
    get friendstables_url
    assert_response :success
  end

  test "should get new" do
    get new_friendstable_url
    assert_response :success
  end

  test "should create friendstable" do
    assert_difference('Friendstable.count') do
      post friendstables_url, params: { friendstable: { email: @friendstable.email, first_name: @friendstable.first_name, last_name: @friendstable.last_name, phone: @friendstable.phone, twitter: @friendstable.twitter } }
    end

    assert_redirected_to friendstable_url(Friendstable.last)
  end

  test "should show friendstable" do
    get friendstable_url(@friendstable)
    assert_response :success
  end

  test "should get edit" do
    get edit_friendstable_url(@friendstable)
    assert_response :success
  end

  test "should update friendstable" do
    patch friendstable_url(@friendstable), params: { friendstable: { email: @friendstable.email, first_name: @friendstable.first_name, last_name: @friendstable.last_name, phone: @friendstable.phone, twitter: @friendstable.twitter } }
    assert_redirected_to friendstable_url(@friendstable)
  end

  test "should destroy friendstable" do
    assert_difference('Friendstable.count', -1) do
      delete friendstable_url(@friendstable)
    end

    assert_redirected_to friendstables_url
  end
end
