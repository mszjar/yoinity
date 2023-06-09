require "test_helper"

class PotentialUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get potential_users_create_url
    assert_response :success
  end
end
