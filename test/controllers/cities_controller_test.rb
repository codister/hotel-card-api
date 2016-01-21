require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city1)
  end

  test "should get index" do
    get cities_url
    assert_response :success
  end

  test "should create city" do
    assert_difference('City.count') do
      post cities_url, params: { city: { name: @city.name } }
    end

    assert_response 201
  end

  test "should show city" do
    get city_url(@city)
    assert_response :success
  end

  test "should update city" do
    patch city_url(@city), params: { city: { name: @city.name } }
    assert_response 200
  end

  test "should destroy city" do
    assert_difference('City.count', -1) do
      Booking.delete_all
      delete city_url(@city)
    end

    assert_response 204
  end
end
