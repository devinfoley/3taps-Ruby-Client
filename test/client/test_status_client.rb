require 'helper'

class TestStatusClient < Test::Unit::TestCase

  should "get status for posting with BD9FHQC postKey" do
    posting_client = PostingClient.new
    existing_postings = posting_client.get_posting("BD9FHQC")
    client = StatusClient.new
    response = client.get_status(existing_postings)
    p response
    assert_equal GetStatusResponse, response.class
  end

  should "test update status" do
    posting_client = PostingClient.new
    status_client = StatusClient.new
    update_request = StatusUpdateRequest.new
    posting = posting_client.get_posting("BD9FHQC")
    error = Message.new(:code => 666, :message => "UFO posting error")
    posting.status.errors << error
    posting.status.attributes = {:postKey => "TESTKEY", :message => "UFO test message"}
    posting.status.event = 'lost'
    assert_equal "status:'lost', attributes:{postKey:'TESTKEY', message:'UFO+test+message'}, errors:[{code:666, message:'UFO+posting+error'}]", posting.status.to_params
    update_response = status_client.update_status(posting)
    assert_equal Message , update_response.class
    assert_equal 200 , update_response.code
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

end
