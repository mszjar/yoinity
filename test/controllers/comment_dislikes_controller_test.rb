require "test_helper"

class CommentDislikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_dislikes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get comment_dislikes_destroy_url
    assert_response :success
  end
end
