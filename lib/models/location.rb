# Class Location represents structure of location:
#
#  location = Location.new
#  location.countryRank # => Integer
#  location.country     # => String
#  location.cityRank    # => Integer
#  location.city        # => String
#  location.stateCode   # => String
#  location.stateName   # => String
#  location.code        # => String
#  location.latitude    # => Float
#  location.longitude   # => Float
#
#  location.from_array(array) # =>  Array of Location objects
#
class Location < Struct.new(:countryRank, :country, :cityRank, :city, :stateCode, :stateName, :code, :latitude, :longitude)
  include HashedInitializer

  # Method +from_array+ returns array of locations(create from json).
  # Takes value of array objects as json parameter array.
  #
  # Example:
  #
  #  Location.from_array([...array of JSON objects...]) # => Array of Location
  #
  def self.from_array(array)
    array.collect do |element|
      Location.new(element)
    end
  end
end
