#private SearchRequest searchRequest;
#private String dimension;
class SummaryRequest
  attr_accessor :search_request, :dimension
  
  def query_params
    query_params = ''
    query_params = "dimension=#{CGI.escape(dimension)}&" if (dimension != nil)
    query_params += search_request.query_params if (search_request != nil)
    query_params
  end

end
