require 'helper'

class TestGeoCoderResponse < Test::Unit::TestCase
  should "receive an array and perform it into hash" do
    geocoder_response = GeocoderResponse.from_array([['TEST','123.9876','-123.98765'],['TEST','123.9876','-123.98765']])
    assert_equal Array, geocoder_response.class
    geocoder_response.each do |geocode|
      assert_equal GeocoderResponse, geocode.class
      assert_equal 'TEST', geocode.code
      assert_equal '123.9876', geocode.latitude
      assert_equal '-123.98765', geocode.longitude
    end
  end
end