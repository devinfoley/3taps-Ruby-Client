class SearchResponse
  attr_accessor :success, :num_results, :exec_time_ms, :results

  def self.from_array(json)
    res = self.new
    res.success = json["success"]
    res.num_results = json["numResults"]
    res.exec_time_ms = json["execTimeMs"]
    res.results = []
    json["results"].each do |posting|
        res.results << Posting.new(posting)
    end    
    res
  end

end
