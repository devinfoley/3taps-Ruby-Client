require 'helper'

class TestRangeRequest < Test::Unit::TestCase
  should "return valid http params string" do
    search_request = SearchRequest.new
    search_request.category = 'VAUT'
    search_request.annotations = {:Make => "porsche"}
    range_request = RangeRequest.new(:search_request => search_request, :fields => ["year","price"])
    assert_equal "category=VAUT&annotations=%7B%22Make%22%3A%22porsche%22%7D&fields=year%2Cprice",  range_request.query_params
  end
end
