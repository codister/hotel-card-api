class RemoveCityFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :city, index: true, foreign_key: true
  end
end
