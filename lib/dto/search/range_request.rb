# Returns the minium and maximum values currently in 3taps for the given fields
# that match the given Common Search Criteria. The purpose of the range method
# is to provide developers with sensible values for range-based UI filters.
#
# range_request = RangeRequest.new
# search_request = SearchRequest.new
# search_request.category = 'VAUT'
# search_request.annotations = {:Make => "porsche"}
# range_request.search_request = search_request
# range_request.fields = ['year', 'price']
#
class RangeRequest < Struct.new(:search_request, :fields)

  def add_field(field)
    fields << field
  end

  def query_params
    query_params = search_request.query_params
    query_params += "fields=#{CGI.escape(fields.join(','))}"
    query_params
  end
end
