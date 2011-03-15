#private String code;
#private Float latitude;
#private Float longitude;
class GeocoderResponse < Struct.new(:code, :latitude, :longitude)
  def self.from_array(array)
     array.collect do |geocode|
      self.new(geocode)
    end
  end
end
