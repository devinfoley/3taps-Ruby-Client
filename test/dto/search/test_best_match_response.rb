require 'helper'

class TestBestMatchResponse < Test::Unit::TestCase
  should "get numResults attribute" do
    response = BestMatchResponse.new("numResults" => 200)
    assert_equal 200, response.numResults
    assert_equal 200, response.num_results
  end
end
