#private SearchRequest searchRequest;
#private String dimension;
class SummaryRequest
  attr_accessor :search_request, :dimension
  
  def query_params
    query_params = search_request.query_params
    query_params += "dimension=#{CGI.escape(dimension)}&"
    query_params
  end
end
