#private SearchRequest searchRequest;
#private String dimension;
class SummaryRequest
  attr_accessor :search_request, :dimension
  
  def get_query_params
    query_params = search_request.get_query_params
    if (dimension != nil)
      query_params[:dimension] = dimension
    end
    query_params
  end
end
