class GetResponse
  attr_accessor :exists, :externalID, :source, :history
#a.bratashov: delete after success UnitTesting
#  def self.from_json(json)
#    result = self.new
#    result.exists = json["exists"]
#    result.externalID = json["externalID"]
#    result.source = json["source"]
#    result.history = PostingHistory.new(json["history"])
#    result
#  end

end
