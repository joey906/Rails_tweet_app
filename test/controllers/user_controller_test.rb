require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get login-form" do
    get user_login-form_url
    assert_response :success
  end

end
