require 'test_helper'

class TribeMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tribe_members_index_url
    assert_response :success
  end

  test "should get new" do
    get tribe_members_new_url
    assert_response :success
  end

end
