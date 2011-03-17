#private Map<String, Range> ranges;
class RangeResponse < Struct.new(:ranges) 
  include HashedInitializer
  class Range < Struct.new(:field, :min, :max)
    include HashedInitializer
  end
  def self.from_array(json)
    self.new(:ranges => json.collect { |key, value| Range.new( :field => key, :max => value["max"], :min => value["min"])})
  end
end
