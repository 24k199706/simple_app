require 'test_helper'

class SimplesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get simples_home_url
    assert_response :success
  end

end
