#private String code;
#private Float latitude;
#private Float longitude;
class GeocoderResponse < Struct.new(:code, :latitude, :longitude)
  include HashedInitializer
  def self.from_json(json)
    arr = []
    json.each do |geocode|
      arr << self.new(geocode)
    end
    arr
  end
end
