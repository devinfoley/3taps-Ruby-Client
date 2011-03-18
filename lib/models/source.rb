# Class Source represents structure of source
#
#  source = Source.new
#  source.name        # => String
#  source.code        # => String
#  source.logo_url    # => String
#  source.logo_sm_url # => String
#  source.hidden      # => Boolean
#
#  source.from_array(array) # =>  Array of Source objects
#
class Source < Struct.new(:name, :code, :logo_url, :logo_sm_url, :hidden)
  include HashedInitializer

  # Method +from_array+ returns array of sources(create from json).
  # Takes value of array objects as json parameter array.
  #
  # Example:
  #
  #  Source.from_array([...array of JSON objects...]) # => Array of Source
  #
  def self.from_array(array)
    array.collect do |element|
      Source.new(element)
    end
  end
end