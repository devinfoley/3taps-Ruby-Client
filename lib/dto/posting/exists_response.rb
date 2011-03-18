# NOT USED
#
# Class ExistsResponse represents server response on +exists+ Posting API
# request. Server response is sent to +from_hash+ method which creates object
# with attribute +success+ accessible via getter:
#
#  response = ExistsResponse.from_hash("success" => "true")
#  response.success       # => true
#
class ExistsResponse
  attr_accessor :exists, :postKey, :error

  def self.from_array(json)
    json
  end
end
