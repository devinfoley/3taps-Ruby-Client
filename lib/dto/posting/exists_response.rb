# NOT USED
#
# Class ExistsResponse represents server response on +exists+ Posting API
# request. Server response is sent to +from_hash+ method which creates object
# with attribute +success+ accessible via getter:
#
#  response = ExistsResponse.from_hash("success" => "true")
#  response.success       # => true
#
class ExistsResponse < Struct.new(:indexed, :postKey, :exists, :failures)
  def initialize(hash = {})
    hash.each do |key, value|
      self.send("#{key}=".to_sym, value )
    end
  end
end
