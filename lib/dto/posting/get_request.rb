class GetRequest
  attr_accessor :source, :externalID

  def to_json
    posting = "{"+'source:'+"'#{self.source}'" + ',externalID:' + "'#{self.externalID}'"
    posting  +  "}"
  end

end
