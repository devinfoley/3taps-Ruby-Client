class SearchResponse < Struct.new(:success, :numResults, :execTimeMs, :results) do
    def num_results
      numResults
    end
    def exec_time_ms
      execTimeMs
    end
  end

  def initialize(hash = {})
    hash.each do |key, value|
      self.send("#{key}=".to_sym, key == 'results' ? value.collect {|item| Posting.new(item)} : value )
    end
  end
end