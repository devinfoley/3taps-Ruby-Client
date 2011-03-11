require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe SearchRequest do
  before(:each) do
    @search_request = SearchRequest.new
  end

  it "should return valid query params" do
    
    @search_request.rpp = 10
    @search_request.page = 20
    @search_request.source = 'SRC'
    @search_request.category = 'CAT'
    @search_request.location = 'LOC'
    @search_request.heading = 'HD'
    @search_request.body = 'BD'
    @search_request.text = 'TXT'
    @search_request.external_id = 'EXID'
    @search_request.start = Date.new(2011,4,10)
    @search_request.end = Date.new(2011,4,10)
    @search_request.annotations = Hash["ANN1", '100', "ANN2", '200']
    @search_request.trusted_annotations = Hash["TR1", '1000', "TR2", '2000']
    @search_request.retvals = ["ret1", "ret2", "ret3"]
    @search_request.query_params.should == ""
  end
end

