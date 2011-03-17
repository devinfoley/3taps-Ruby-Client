require 'helper'

class TestStatusClient < Test::Unit::TestCase

  should "get status for posting with BD9FHQC code" do
    posting_client = PostingClient.new
    existing_postings = posting_client.get_posting("BD9FHQC")
    client = StatusClient.new
    response = client.get_status(existing_postings)
    p response
  end

=begin
  should "test update status" do
    posting_client = PostingClient.new
    status_client = StatusClient.new
    posting_response = posting_client.get_posting("BD9FHQC")
    update_response = status_client.update_status(posting_response)
    assert_equal Message , update_response.class
  end



  should "test get status" do
    search_request = SearchRequest.new
    search_request.category = 'VAUT'
    search_request.annotations = {:Make => "porsche"}
    search_request.rpp = 2
    search_request.page = 4
    search_request.retvals = ["category", "location", "heading", "externalURL", "timestamp", "postKey", "source", "image", "externalID"]

    client = SearchClient.new
    search_response = client.search(search_request)
    existing_postings = search_response.results
    client = StatusClient.new
    response = client.get_status(existing_postings)
    assert_equal Array, response.class
  end
  
  should "test system status" do
    client = StatusClient.new
    status_response = client.system_status
    assert_equal Message, status_response.class
  end
=end
end
