require 'helper'

class TestGeocoderClient < Test::Unit::TestCase
  should "test coordinats geocode" do
    geocoder_client = GeocoderClient.new
    geocoder_request = GeocoderRequest.new
    geocoder_request.latitude = '37.77493'
    geocoder_request.longitude = '-122.41942'
    request = geocoder_request
    response = geocoder_client.geocode(request)
    assert_equal Array, response.class
    assert_equal GeocoderResponse, response.first.class
    assert_equal "CAZ", response.first.code
  end

  should "test city geocode" do
    geocoder_client = GeocoderClient.new
    geocoder_request = GeocoderRequest.new
    geocoder_request.city = 'los angeles'
    request = geocoder_request
    response = geocoder_client.geocode(request)
    assert_equal Array, response.class
    assert_equal GeocoderResponse, response.first.class
    assert_equal "LAX",  response.first.code
  end

  should "test both city and geocode" do
    geocoder_client = GeocoderClient.new
    geocoder_request1 = GeocoderRequest.new
    geocoder_request1.latitude = '37.77493'
    geocoder_request1.longitude = '-122.41942'

    geocoder_request2 = GeocoderRequest.new
    geocoder_request2.city = 'los angeles'

    request = [geocoder_request1, geocoder_request2]
    response = geocoder_client.geocode(request)
    assert_equal Array, response.class
    assert_equal GeocoderResponse, response.first.class
    assert_equal "CAZ", response.first.code
    assert_equal "LAX", response[1].code
  end
end