# Class RangeResponse represents server response on +range+ Search API
# request. Server response is sent to +from_array+ method which creates objects
# with attribute +ranges+ accessible via getter:
#
#  response = RangeResponse.from_array(...)
#  response.ranges     # => Array
#
class RangeResponse < Struct.new(:ranges) 
  
  # Class Range represents elements of server response on +range+ Search API
  # request. Server response is sent to initializer which creates object
  # with attributes +field+, +min+, +max+ accessible via getters:
  #
  #  range = Range.new(...)
  #  range.field   # => Array
  #  range.min     # => 10
  #  range.max     # => 20
  #
  class Range < Struct.new(:field, :min, :max)
  end

  # Method +from_array+ creates RangeResponse object with a set of Range objects.
  def self.from_array(json)
    self.from_hash(:ranges => json.collect { |key, value| Range.from_hash( :field => key, :max => value["max"], :min => value["min"])})
  end
end
