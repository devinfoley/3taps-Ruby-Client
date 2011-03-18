# The SearchClient class allows clients to query 3taps Search API for data,
# and data about data.
#
# Its methods are used to query API with appropriate requests:
#  client = SearchClient.new
#  client.search(search_request)    # => returns array of SearchResponse objects
#  client.range(range_request)      # => returns array of RangeResponse objects
#  client.summary(summary_request)  # => returns array of SummaryResponse objects
#  client.count(search_request)     # => returns array of CountResponse objects
#  client.best_match(keywords)      # => returns array of BestMatchResponse objects
class SearchClient < Client

  # Method +search+ searches 3taps for postings. Example:
  #
  #  request = SearchRequest.new
  #  client = SearchClient.new
  #  client.search(request)     # => SearchResponse
  #
  def search(search_request)
    response = execute_get("/search", search_request.query_params)
    SearchResponse.new(decode(response))
  end

  # Method +range+ returns the minium and maximum values currently in 3taps for
  # the given fields that match the given Common Search Criteria inside of the
  # RangeResponse object. The purpose of the range method is to provide
  # developers with sensible values for range-based UI filters.
  #
  # Examples:
  #
  #  request = RangeRequest.new
  #  client = SearchClient.new(request)
  #  client.range(request)        # => RangeResponse
  #
  def range(range_request)
    response = execute_get("/search/range", range_request.query_params)
    RangeResponse.from_array(decode(response))
  end

  # Method +summary+ returns the total number of postings found in 3taps, across
  # the given dimension, that match the given Common Search Criteria parameters
  # inside of the SummaryResponse object. Searching for "text=toyota" across
  # "dimension=source" would return a list of all sources in 3taps, along with
  # the number of postings matching the search "text=toyota" in that source.
  # You may currently search across dimensions source, category, and location.
  #
  # Examples:
  #
  #  request = SummaryRequest.new
  #  client = SearchClient.new
  #  client.summary(request)      # => SummaryResponse
  #
  def summary(summary_request)
    response = execute_get("/search/summary", summary_request.query_params)
    SummaryResponse.from_hash(decode(response))
  end

  # Method +count+ returns the total number of postings that match the given
  # Common Search Criteria represented by SearchRequest. Example:
  #
  #  request = SearchRequest.new
  #  client = SearchClient.new
  #  client.count(request)      # => CountResponse
  #
  def count(search_request)
    response = execute_get("/search/count", search_request.query_params)
    CountResponse.new(decode(response))
  end

  # Method +best_match+ returns the 3taps category associated with the keywords,
  # along with the number of postings in that category. Example:
  #
  #  keywords = "iPad,Apple,iPhone"
  #  client = SearchClient.new
  #  client.count(keywords)     # => BestMatchResponse
  # 
  def best_match(keywords)
    response = execute_get("/search/best-match", "keywords=#{keywords}")
    BestMatchResponse.from_hash(decode(response))
  end

end
