# Class SearchResponse represents server response on +search+ Search API
# request. Server response is sent to initializer which creates object with
# attributes +success+, +numResults+, +execTimeMs+, +results+ accessible via getters:
# * +success+
# * +num_results+
# * +numResults+
# * +execTimeMs+
# * +exec_time_ms+
# * +results+
#
# Examples:
#
#  response = SearchResponse.new("success" => "true", "numResults" => 0, "execTimeMs" => 100, "results" => [])
#  response.category     # => "VAUT"
#  response.numResults   # => 0
#  response.num_results  # => 0
#  response.execTimeMs   # => 100
#  response.exec_time_ms # => 100
#  response.results      # => []
#
class SearchResponse < Struct.new(:success, :numResults, :execTimeMs, :results) do
    def num_results
      numResults
    end
    def exec_time_ms
      execTimeMs
    end
  end

  # Initializer receives hash as a parameter and fills object fields from it. 
  # +results+ field is filled with array of Posting objects.
  def initialize(hash = {})
    hash.each do |key, value|
      self.send("#{key}=".to_sym, key == 'results' ? value.collect {|item| Posting.new(item)} : value )
    end
  end
end