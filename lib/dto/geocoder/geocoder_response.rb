class GeocoderResponse < Struct.new(:code, :latitude, :longitude)
  def self.from_array(array)
     array.collect do |geocode|
      res = self.new
      res.code = geocode[0]
      res.latitude = geocode[1]
      res.longitude = geocode[2]
      res
    end
  end
end
