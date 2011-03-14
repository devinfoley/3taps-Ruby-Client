#private SearchRequest searchRequest;
#private List<String> fields = new ArrayList<String>();
class RangeRequest
  attr_accessor :search_request, :fields

  def initialize
    @fields = []
  end

  def add_field(field)
    @fields << field
  end

  def query_params
    query_params = search_request.query_params
    query_params += "fields=#{CGI.escape(fields.join(','))}"
    query_params
  end


#	public void addField(String field) {
#		this.fields.add(field);
#	}
#
#	public Map<String, String> getQueryParams() {
#
#		final Map<String, String> queryParams = searchRequest.getQueryParams();
#		queryParams.put("fields", Utils.join(fields));
#
#		return queryParams;
#	}
end
