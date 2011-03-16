class GetResponse
  attr_accessor :exists, :externalID, :source, :history
#a.bratashov: delete after success unit testing
#  def self.from_array(json)
#    result = self.new
#    result.exists = json["exists"]
#    result.externalID = json["externalID"]
#    result.source = json["source"]
#    result.history = PostingHistory.new(json["history"]) if json["history"]
#    result
#  end

end
