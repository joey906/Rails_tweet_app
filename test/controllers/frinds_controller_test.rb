require 'test_helper'

class FrindsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get frinds_all_url
    assert_response :success
  end

end
