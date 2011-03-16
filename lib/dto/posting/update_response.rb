class UpdateResponse
  attr_accessor :success

  def self.from_array(json)
    results = self.new
    results.success = json["success"]
    results
  end
end
