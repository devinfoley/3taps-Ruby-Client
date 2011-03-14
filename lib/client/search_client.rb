class SearchClient < Client

  def search(search_request)
    response = execute_get("/search", search_request.query_params)
    SearchResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def range(range_request)
    response = execute_get("/search", range_request.query_params)
    RangeResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def summary(summary_request)
    response = execute_get("/search/summary", summary_request.query_params)
    SummaryResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def count(search_request)
    #request = SearchRequest.new
    #request.rpp = 10
    #request.text = "porsche"
    #client = SearchClient.new
    #response = client.count(request)
    #postings_quantity = response.count
    response = execute_get("/search/count", search_request.query_params)
    CountResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def best_match(keywords)
    #keywords = "iPad,Apple,iPhone"
    #client = SearchClient.new
    #response = client.count(keywords)
    #category_code = response.category
    #postings_quantity = response.num_results
    response = execute_get("/search/best-match", "keywords=#{keywords}")
    BestMatchResponse.from_json(ActiveSupport::JSON.decode(response))
  end

end
