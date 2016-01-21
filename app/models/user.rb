class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  def render_bookings
    {
      "id": self.id,
      "name": self.name,
      "bookings": self.bookings,
    }
  end
end
