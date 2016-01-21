require 'test_helper'

class UserBookableControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get '/api/v0/user_bookable'
    assert_response :success
  end
end
