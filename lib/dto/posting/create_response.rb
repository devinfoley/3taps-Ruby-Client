#private String postKey;
#private Message error;

class CreateResponse
  attr_accessor :postKey, :error

  def self.from_json(json)
    results = self.new
    results.postKey = json["postKey"]
    results.error = json["error"]
    results
  end
end
