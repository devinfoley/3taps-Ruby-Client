require 'helper'

class TestRangeRequest < Test::Unit::TestCase
  should "return valid http params string" do
    search_request = SearchRequest.from_hash(:category => 'VAUT', :annotations => {:Make => "porsche"})
    #search_request.category = 'VAUT'
    #search_request.annotations = {:Make => "porsche"}
    range_request = RangeRequest.from_hash(:search_request => search_request, :fields => ["year","price"])
    assert_equal RangeRequest,  range_request.class
    assert_equal SearchRequest,  range_request.search_request.class
    assert_equal String,  range_request.query_params.class
  end
end
