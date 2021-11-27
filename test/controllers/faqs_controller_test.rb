require 'test_helper'

class FaqsControllerTest < ActionDispatch::IntegrationTest
  test "should get question" do
    get faqs_question_url
    assert_response :success
  end

end
