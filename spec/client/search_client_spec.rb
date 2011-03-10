require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchClient do
  before(:each) do
    @search_client = SearchClient.new
  end

  it "should send GET request and create SearchResponse from result" do
    search_request = mock("search_request")
    search_request.should_receive(:get_query_params)
    search_response = mock "search_response"
    SearchResponse.should_receive(:from_json).and_return search_response
    
    @search_client.search(search_request).should == search_response
  end
end

