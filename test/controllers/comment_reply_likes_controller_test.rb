require "test_helper"

class CommentReplyLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_reply_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get comment_reply_likes_destroy_url
    assert_response :success
  end
end
