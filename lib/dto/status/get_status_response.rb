class GetStatusResponse < Struct.new(:exists, :externalID, :source, :history)
  class Status < Struct.new(:field, :attrs)
  end
  class Attr < Struct.new(:timestamp, :errors, :attributes)
  end
  def self.from_array(json)
     json.each do |hash|
      hash.each do |key, value|
        self.new("#{key}=".to_sym, key == 'history' ?  value.collect {
          |key, items| Status.new(:field => key, :attrs => items.collect {|item| 
           Attr.new(:timestamp => item["timestamp"], :errors => item["errors"], :attributes => item["attributes"]) }
          )} : value )
      end
    end
  end
end
