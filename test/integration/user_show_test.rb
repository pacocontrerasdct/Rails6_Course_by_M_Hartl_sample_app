require "test_helper"

class UserShowTest < ActionDispatch::IntegrationTest

  def setup
    @user_inactive = users(:inactive)
    @user_active = users(:archer)
  end
  
  test "should redirect when inactive user" do
    get user_path(@user_inactive)
    assert_response      302
    assert_redirected_to root_url
  end
  
  test "should display user when activated" do
    get user_path(@user_active)
    assert_response 200
    assert_template 'users/show'
  end
end
