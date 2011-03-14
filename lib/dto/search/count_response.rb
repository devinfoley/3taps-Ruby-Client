#private Integer count;
class CountResponse
  attr_accessor :count

  def self.from_json(json)
    #method usage: CountResponse.from_json(ActiveSupport::JSON.decode(response))
    res = self.new
    res.count = json["count"]
    res
  end
end
