require "test_helper"

class PostQualityControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_quality_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_quality_destroy_url
    assert_response :success
  end

  test "should get post_quality_params" do
    get post_quality_post_quality_params_url
    assert_response :success
  end
end
