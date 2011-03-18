require 'helper'

class TestRangeRequest < Test::Unit::TestCase
  should "return valid http params string" do
    search_request = SearchRequest.new
    search_request.category = 'VAUT'
    search_request.annotations = {:Make => "porsche"}
    range_request = RangeRequest.new(:search_request => search_request, :fields => ["year","price"])
    assert_equal String,  range_request.query_params.class
  end
end
