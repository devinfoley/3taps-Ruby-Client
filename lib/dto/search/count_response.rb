# Class CountResponse represents server response on +count+ Search API
# request. Server response is sent to initializer which creates objects with
# attribute +count+ accessible via getter:
#
#  response = CountResponse.new("count" => 20)
#  response.count  # => 20
#
class CountResponse < Struct.new(:count)
end
