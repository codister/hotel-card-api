require 'test_helper'
require 'json'

class UserBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    @booking = bookings(:booking1)
  end

  test "get all user bookings" do
    get "/api/v0/users/#{@user.id}/bookings"
    body = JSON.parse(@response.body)
    assert_equal body, {
      "id"=> @user.id,
      "name"=> @user.name,
      "bookings"=> [{
        "id"=>@user.bookings[0].id,
        "hotel"=>@user.bookings[0].hotel.name,
        "city"=>@user.bookings[0].hotel.city.name,
        "user"=>@user.name,
        "date"=>@user.bookings[0].date.to_s,
      }]
    }
  end
end
