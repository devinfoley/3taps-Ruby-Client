class GetRequest
  attr_accessor :source, :externalID, :status, :timestamp, :attributes

   def to_json_for_status_update
    # {"source":"E_BAY","externalID":"3434399120","status":"sent","timestamp":"2011/12/21 01:13:28","attributes":{"postKey":"3JE8VFD"}}
    data = "{source: '"
    data <<  self.source
    data << "', externalID: "
    data << self.externalID
    data << "', status: "
    data << self.status
    data << "', timestamp: "
    data << self.timestamp
    if self.attributes
      data << "', attributes: }"
      data << self.attributes
      data << "}"
    end
    data << "}"
    data
  end

end
