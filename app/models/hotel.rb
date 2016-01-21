class Hotel < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates :city, presence: true

  has_many :bookings, dependent: :destroy
  def as_json(options={})
    {
      name: self.name,
      id: self.id,
      city: self.city.name,
      city_id: self.city.id,
    }
  end
end
