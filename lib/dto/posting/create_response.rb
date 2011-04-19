# Class CreateResponse represents server response on +create+ Posting API
# request. Server response is sent to +from_array+ method which creates objects
# with attributes +postKey+, +error+ accessible via getters:
#
#  response = RangeResponse.from_array(...)
#  response.postKey     # => String
#  response.post_key    # => String
#  response.error       # => String
#
class CreateResponse < Struct.new(:postKey, :error, :errors) do
    def post_key
      postKey
    end
  end

  # Method +from_array+ creates an array of CreateResponse objects from a given
  # array of JSON hashes.
  def self.from_array(array)
    array.collect do |element|
      CreateResponse.from_hash(element)
    end
  end
end
