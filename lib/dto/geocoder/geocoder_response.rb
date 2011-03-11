#private String code;
#private Float latitude;
#private Float longitude;
class GeocoderResponse
  attr_accessor :code, :latitude, :longitude

  def self.from_json(json)
    self.new
  end
end
