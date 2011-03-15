require 'helper'

class TestGeocoderClient < Test::Unit::TestCase
  should "test geocode" do
    client = GeocoderClient.new
    response = client.geocode("San Francisco")
    assert_equal Array, response
  end
end
