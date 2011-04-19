class GeocoderResponse < Struct.new(:code, :latitude, :longitude, :errors)
  def self.from_array(array)
     array.collect do |geocode|
      from_hash(:code => geocode[0], :latitude => geocode[1], :longitude => geocode[2])
    end
  end
end
