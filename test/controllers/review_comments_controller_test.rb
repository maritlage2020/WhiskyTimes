require 'test_helper'

class ReviewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get review_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get review_comments_destroy_url
    assert_response :success
  end

end
