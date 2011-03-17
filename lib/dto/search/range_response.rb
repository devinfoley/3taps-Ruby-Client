class RangeResponse < Struct.new(:ranges) 
  class Range < Struct.new(:field, :min, :max)
  end
  def self.from_array(json)
    self.from_hash(:ranges => json.collect { |key, value| Range.from_hash( :field => key, :max => value["max"], :min => value["min"])})
  end
end
