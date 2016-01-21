API_KEY = ENV["GOOGLE_API_KEY"]
PLACES_CLIENT = GooglePlaces::Client.new(API_KEY)

class UserBookableController < ApplicationController
  def get
    location = Geocoder.search(request.remote_ip)[0].coordinates
    spots = PLACES_CLIENT.spots(
      location[0],
      location[1],
      radius: 5000,
      types: 'lodging',
    ).first(10).map { |spot| PLACES_CLIENT.spot(spot[:place_id]) }.map {
      |spot| {
        city: spot.city,
        name: spot.name,
      }
    }
    spots.each do |spot|
      Hotel.find_or_create_by(
        name: spot[:name], city: City.find_or_create_by(name: spot[:city])
      )
    end
    render json: spots.map {|spot| Hotel.find_by(name: spot[:name]) }
  end
end
