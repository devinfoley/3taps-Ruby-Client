class GetStatusResponse
  
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
  def self.from_array(array)
    mas = []
    array.collect do |element|
      result = self.new
      result.exists = element["exists"]
      result.externalID = element["externalID"] 
      result.source = element["source"] 
      if element["history"] != nil
        result.history = PostingHistory.new(element["history"])
      else
        result.history = nil
      end
      mas << result
    end
    mas
  end
end


