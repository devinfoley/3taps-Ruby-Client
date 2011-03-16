require 'helper'

class TestStatusClient < Test::Unit::TestCase
  should "test update status" do

  end

  should "test get status" do
   search_request = SearchRequest.new
    search_request.category = 'VAUT'
    search_request.annotations = {:Make => "porsche"}
    search_request.rpp = 5
    search_request.page = 4
    search_request.retvals = ["category", "location", "heading", "externalURL", "timestamp", "postKey", "source", "image", "externalID"]

    client = SearchClient.new
    search_response = client.search(search_request)
    existing_postings = search_response.results
    #p existing_postings

    client = StatusClient.new
    response = client.get_status(existing_postings)
    #p response
    assert_equal GetResponse, response.class
  end

  should "test get status and update it" do
   search_request = SearchRequest.new
    search_request.category = 'VAUT'
    search_request.annotations = {:Make => "porsche"}
    search_request.rpp = 5
    search_request.page = 4
    search_request.retvals = ["category", "location", "heading", "externalURL", "timestamp", "postKey", "source", "image", "externalID"]

    client = SearchClient.new
    search_response = client.search(search_request)
    existing_postings = search_response.results
    #p existing_postings

    client = StatusClient.new
    response = client.get_status(existing_postings)
    #p response
    assert_equal GetResponse, response.class
  end

  #should "test system status" do
    #client = StatusClient.new
    #status_response = client.system_status
    #assert_equal Message, status_response.class
  #end
end
