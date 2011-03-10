#private Map<String, Range> ranges;
class RangeResponse

  class Range
    #private Integer min;
		#private Integer max;
    attr_accessor :min, :max
  end

  attr_accessor :ranges
end
