require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
    @third_user = users(:loke)
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              "password",
                                            password_confirmation: "password",
                                            admin: true } }
    assert_not @other_user.admin?
  end

  test "redirected if non-admin tries to remove user" do
  	log_in_as(@other_user)
  	assert_not @other_user.admin?
  	delete user_path(@third_user)
  	assert_redirected_to root_url
  	assert User.exists?(@third_user.id)
  end

  test "redirected when not logged in as user, tries to remove user" do
  	assert_no_difference 'User.count' do
  		delete user_path(@third_user)
  	end
  	assert_redirected_to login_url
  end
end
