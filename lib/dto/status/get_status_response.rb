# Class GetStatusResponse represents server response on +get_status+ Status API
# request. Server response is sent to +from_array+ method which creates objects
# attributes +exists+, +externalID+, +source+, +history+ accessible via getters:
# * +exists+
# * +externalID+
# * +source+
# * +history+
#
# Example:
#
#  response = GetStatusResponse.from_array(...)    # => Array
#
class GetStatusResponse < Struct.new(:exists, :externalID, :source, :history)
  # Class Status represents elements of server response on +get_status+ Status API
  # request. Server response is sent to initializer which creates object
  # with attributes +field+, +attrs+ accessible via getters:
  #
  #  status = Status.new(...)
  #  status.field     # => Array
  #  status.attrs     # => Array of Attr
  #
  class Status < Struct.new(:field, :attrs)
  end
  # Class Attr represents elements of server response on +get_status+ Status API
  # request. Server response is sent to initializer which creates object
  # with attributes +timestamp+, +errors+, +attributes+ accessible via getters:
  #
  #  attr = Attr.new(...)
  #
  class Attr < Struct.new(:timestamp, :errors, :attributes)
  end
  # Method +from_array+ creates GetStatusResponse object
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
