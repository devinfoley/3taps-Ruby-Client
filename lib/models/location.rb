class Location < SuperModel::Base
  attributes :countryRank, :country, :cityRank, :city, :stateCode, :stateName, :code, :latitude, :longitude

  def self.from_array(array)
    array.collect do |element|
      Location.new(element)
    end
  end
end
