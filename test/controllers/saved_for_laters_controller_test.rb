require "test_helper"

class SavedForLatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saved_for_laters_index_url
    assert_response :success
  end

  test "should get create" do
    get saved_for_laters_create_url
    assert_response :success
  end

  test "should get destroy" do
    get saved_for_laters_destroy_url
    assert_response :success
  end

  test "should get params" do
    get saved_for_laters_params_url
    assert_response :success
  end
end
