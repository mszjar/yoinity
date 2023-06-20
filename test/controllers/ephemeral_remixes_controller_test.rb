require "test_helper"

class EphemeralRemixesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ephemeral_remixes_index_url
    assert_response :success
  end

  test "should get new" do
    get ephemeral_remixes_new_url
    assert_response :success
  end

  test "should get create" do
    get ephemeral_remixes_create_url
    assert_response :success
  end

  test "should get show" do
    get ephemeral_remixes_show_url
    assert_response :success
  end

  test "should get destroy" do
    get ephemeral_remixes_destroy_url
    assert_response :success
  end
end
