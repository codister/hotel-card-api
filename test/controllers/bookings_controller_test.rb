require 'test_helper'
require 'json'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:booking1)
    @booking2 = bookings(:booking2)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should create booking" do
    post bookings_url, params: {
      booking: {
        hotel_id: Hotel.first.id,
        user_id: User.create(name: "blerb").id,
        date: @booking2.date.to_s,
      }
    }
    assert_response 201
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
    body = JSON.parse @response.body
    assert_equal body, {
      "id"=> @booking.id,
      "hotel"=> @booking.hotel.name,
      "city"=> @booking.hotel.city.name,
      "user"=> @booking.user.name,
      "date"=> @booking.date.to_s,
    }
  end

  test "should update booking" do
    patch booking_url(@booking), params: {
      booking: {
        hotel_id: @booking.hotel_id,
        user_id: User.create(name: "Jack").id,
        date: @booking.date.to_s,
      }
    }
    assert_response 200
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_response 204
  end
end
