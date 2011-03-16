require 'helper'

class TestStatusClient < Test::Unit::TestCase
  should "test update status" do
    
  end

  should "test get status" do
    posting_client = PostingClient.new
    search_client = SearchClient.new
    search_request = SearchRequest.new
    search_request.source = "3TAPS"
    search_request.retvals = ["postKey"]
    response = search_client.search(search_request)
    first_key = response.results.first.postKey
    existing_posting =  posting_client.get_posting(first_key)
    client = StatusClient.new
    response = client.get_status(existing_posting)
    assert_equal GetResponse, response.class
  end

  should "test system status" do
    client = StatusClient.new
    status_response = client.system_status
    assert_equal Message, status_response.class
  end
end
