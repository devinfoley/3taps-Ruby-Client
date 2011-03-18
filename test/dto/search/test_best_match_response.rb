require 'helper'

class TestBestMatchResponse < Test::Unit::TestCase
  should "get numResults attribute" do
    response = BestMatchResponse.from_hash("numResults" => 200, "category" => "VAULT")
    assert_equal 200, response.numResults
    assert_equal 200, response.num_results
    assert_equal "VAULT", response.category
  end
end
