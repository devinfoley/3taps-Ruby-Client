class GetResponse
  
  attr_accessor :exists, :externalID, :source, :history

  def self.from_json(json)
    result = self.new
    result.exists = json["exists"]
    result.externalID = json["externalID"]
    result.source = json["source"]
    result.history = PostingHistory.new(json["history"]) if json["history"]
    result
  end

  def self.from_array(array)
      p array
      
      array.collect do |element|
        result = self.new
        result.exists = element["exists"]
        result.externalID = element["externalID"] if element["externalID"] != nil
        result.source = element["source"] if element["source"] != nil
        result.history = PostingHistory.new(element["history"]) if element["history"] != nil
        #GetResponse.new(result)
      end
end

end


