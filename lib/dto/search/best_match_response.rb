# Class BestMatchResponse represents server response on +best_match+ Search API
# request. Server response is sent to initializer which creates objects with
# attributes +category+, +numResults+ accessible via getters:
# * +category+
# * +num_results+
# * +numResults+
#
# Examples:
#
#  response = BestMatchResponse.new("category" => "VAUT", "numResults" => 20)
#  response.category     # => "VAUT"
#  response.numResults   # => 20
#  response.num_results  # => 20
#
class BestMatchResponse < Struct.new(:category, :numResults, :error) do
    def num_results
      numResults
    end
  end
  def initialize(hash = {})
    hash.each do |key, value|
      self.send("#{key}=".to_sym, value )
    end
  end
end