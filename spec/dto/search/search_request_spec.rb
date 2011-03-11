require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe SearchRequest do
  before(:each) do
    @search_request = SearchRequest.new
  end

  it "should return valid query params" do
    @search_request.rpp = 20
    @search_request.page = 14
    #@search_request.source = 'SRC'
    @search_request.category = 'STOO'
    #@search_request.location = 'LOC'
    #@search_request.heading = 'HD'
    #@search_request.body = 'BD'
    @search_request.text = 'BMW'
    #@search_request.external_id = 'EXID'
    #@search_request.start = Date.new(2011,4,10)
    #@search_request.end = Date.new(2011,4,10)
    @search_request.annotations = Hash["Status", 'for+free']
    #@search_request.trusted_annotations = Hash["TR1", '1000', "TR2", '2000']
    @search_request.retvals = ["category", "location", "heading", "externalURL", "timestamp", "postKey", "source", "image"]
    @search_request.query_params.should_not == ""
    p @search_request.query_params
  end
end

