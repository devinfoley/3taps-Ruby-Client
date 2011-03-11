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
    response = execute_get("/search", summary_request.query_params)
    SummaryResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  def count(count_request)
    response = execute_get("/search/count", count_request.query_params)
    CountResponse.from_json(ActiveSupport::JSON.decode(response)["count"])
  end

  def best_match(search_request)
    response = execute_get("/search/bestMatch", search_request.query_params)
    BestMatchResponse.from_json(ActiveSupport::JSON.decode(response))
  end

end
