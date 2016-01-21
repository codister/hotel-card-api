class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  validates :hotel, presence: true
  validates :user, presence: true
  validates :date, presence: true
  validate :no_multiple_bookings_on_same_date

  def no_multiple_bookings_on_same_date
    if Booking.exists?(user_id: self.user.id, date: self.date.to_s)
      errors.add(:user, "Cannot book multiple times for the same date and user")
    end
  end
  def as_json(options={})
    {
      id: self.id,
      hotel: self.hotel.name,
      city: self.hotel.city.name,
      user: self.user.name,
      date: self.date.to_s,
    }
  end
end
