#private String category;
#private Integer numResults;
class BestMatchResponse
  attr_accessor :category, :num_results

  def self.from_json(json)
    # method usage: BestMatchResponse.from_json(ActiveSupport::JSON.decode(response))
    res = self.new
    res.category = json["category"]
    res.num_results = json["numResults"]
    res
  end
end