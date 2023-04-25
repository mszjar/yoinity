require "test_helper"

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_likes_destroy_url
    assert_response :success
  end

  test "should get post_like_params" do
    get post_likes_post_like_params_url
    assert_response :success
  end
end
