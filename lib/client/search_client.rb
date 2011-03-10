class SearchClient < Client

  def search(search_request)
    response = execute_get("/search", search_request.get_query_params)
    ActiveSupport::JSON.decode(response)
  end

  def range(range_request)
    response = execute_get("/search", range_request.get_query_params)
    ActiveSupport::JSON.decode(response)
  end

  def summary(summary_request)
    response = execute_get("/search", summary_request.get_query_params)
    ActiveSupport::JSON.decode(response)
  end

  def count(count_request)
    response = execute_get("/search/count", count_request.get_query_params)
    ActiveSupport::JSON.decode(response)["count"]
  end

  def best_match(search_request)
    response = execute_get("/search/bestMatch", search_request.get_query_params)
    ActiveSupport::JSON.decode(response)
  end

end

=begin
package com.threetaps.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.google.gson.reflect.TypeToken;
import com.threetaps.dto.search.BestMatchResponse;
import com.threetaps.dto.search.RangeRequest;
import com.threetaps.dto.search.RangeResponse;
import com.threetaps.dto.search.SearchRequest;
import com.threetaps.dto.search.SearchResponse;
import com.threetaps.dto.search.SummaryRequest;
import com.threetaps.dto.search.SummaryResponse;

public class SearchClient extends Client {

	private static SearchClient instance;

	private SearchClient() {};

	public synchronized static SearchClient getInstance() {
		if (instance == null) instance = new SearchClient();
		return instance;
	}

	public SearchResponse search(SearchRequest searchRequest) throws IOException {

		final HttpResponse response = this.executeGet("/search", searchRequest.getQueryParams());
		final String responseString = EntityUtils.toString(response.getEntity());

		return (SearchResponse) gson.fromJson(responseString, SearchResponse.class);
	}

	public RangeResponse range(RangeRequest rangeRequest) throws IOException {
		final HttpResponse response = this.executeGet("/search", rangeRequest.getQueryParams());
		final String responseString = EntityUtils.toString(response.getEntity());

		return (RangeResponse) gson.fromJson(responseString, RangeResponse.class);
	}

	public SummaryResponse summary(SummaryRequest summaryRequest) throws IOException {
		final HttpResponse response = this.executeGet("/search", summaryRequest.getQueryParams());
		final String responseString = EntityUtils.toString(response.getEntity());

		return (SummaryResponse) gson.fromJson(responseString, SummaryResponse.class);
	}

	public int count(SearchRequest searchRequest) throws IOException {
		final HttpResponse response = this.executeGet("/search/count", searchRequest.getQueryParams());
		final String responseString = EntityUtils.toString(response.getEntity());

		final Map<String, Integer> responseMap = gson.fromJson(responseString, new TypeToken<Map<String, Integer>>() {}.getType());

		return responseMap.get("count").intValue();
	}

	public BestMatchResponse bestMatch(String keywords) throws IOException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("keywords", keywords);
		final HttpResponse response = this.executeGet("/search/bestMatch", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		return (BestMatchResponse) gson.fromJson(responseString, BestMatchResponse.class);
	}
}
=end