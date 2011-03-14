# The SearchClient class allows clients to query 3taps Search API for data,
# and data about data.
#
class SearchClient < Client

  # Searches 3taps for postings. Supports the Common Search Criteria. A request 
  # to search with no Common Search Criteria params will return all postings.
  #
  def search(search_request)
    response = execute_get("/search", search_request.query_params)
    SearchResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Returns the minium and maximum values currently in 3taps for the given fields 
  # that match the given Common Search Criteria. 
  # 
  # The purpose of the range method is to provide developers with sensible values 
  # for range-based UI filters.
  #
  def range(range_request)
    response = execute_get("/search", range_request.query_params)
    RangeResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Returns the total number of postings found in 3taps, across the given dimension, 
  # that match the given Common Search Criteria parameters. For example, 
  # searching for "text=toyota" across "dimension=source" would return a list of 
  # all sources in 3taps, along with the number of postings matching the search 
  # "text=toyota" in that source. You may currently search across dimensions 
  # source, category, and location.
  #
  def summary(summary_request)
    response = execute_get("/search/summary", summary_request.query_params)
    SummaryResponse.from_json(ActiveSupport::JSON.decode(response))
  end

  # Returns the total number of postings that match the given Common Search Criteria.
  # 
  def count(count_request)
    response = execute_get("/search/count", count_request.query_params)
    CountResponse.from_json(ActiveSupport::JSON.decode(response)["count"])
  end

  # Returns the 3taps category associated with the keywords, along with the number
  # of postings in that category.
  #
  def best_match(search_request)
    response = execute_get("/search/bestMatch", search_request.query_params)
    BestMatchResponse.from_json(ActiveSupport::JSON.decode(response))
  end

end
