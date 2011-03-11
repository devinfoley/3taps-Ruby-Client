#private Map<String, Integer> totals;
#private Integer execTimeMs;
class SummaryResponse
  attr_accessor :totals, :exec_time_ms

  def self.from_json(json)
    results = self.new
    results.exec_time_ms = json["execTimeMs"]
    results.totals = json["totals"]
    results
  end

end
