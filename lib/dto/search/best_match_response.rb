class BestMatchResponse < Struct.new(:category, :numResults) do
    def num_results
      numResults
    end
  end
  include HashedInitializer
end