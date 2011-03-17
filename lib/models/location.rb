class Location < Struct.new(:countryRank, :country, :cityRank, :city, :stateCode, :stateName, :code, :latitude, :longitude)
  include HashedInitializer

  def self.from_array(array)
    array.collect do |element|
      Location.new(element)
    end
  end
end
