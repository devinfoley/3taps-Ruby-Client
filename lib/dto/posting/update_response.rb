# Class UpdateResponse represents server response on +update+ Posting API
# request. Server response is sent to +from_hash+ method which creates object
# with attribute +success+ accessible via getter:
#
#  response = UpdateResponse.from_hash("success" => "true")
#  response.success       # => true
#
class UpdateResponse < Struct.new(:success)
end
