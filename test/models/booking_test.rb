require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "cannot book twice on the same day for one user" do
    user = User.create(name: "Jeff")

    Booking.create(
      date: Date.today,
      user: user,
      hotel: hotels(:hotel1),
    )
    booking = Booking.new(
      date: Date.today,
      user: user,
      hotel: hotels(:hotel2),
    )
    assert_not booking.save
  end
end
