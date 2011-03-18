# Class DeleteResponse represents server response on +delete+ Posting API
# request. Server response is sent to +from_hash+ method which creates object
# with attribute +success+ accessible via getter:
#
#  response = DeleteResponse.from_hash("success" => "true")
#  response.success       # => true
#
class DeleteResponse < Struct.new(:success)
end
