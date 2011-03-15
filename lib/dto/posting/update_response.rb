class UpdateResponse
  attr_accessor :success

  def self.from_json(json)
    results = self.new
    results.success = json["success"]
    results
  end
end
