class GeocoderClient < Client

  def geocode(string)
    params = "data=#{string}"
    response = execute_get('geocoder/geocode', params)
    ActiveSupport::JSON.decode(response)
  end

end

=begin
package com.threetaps.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.google.gson.reflect.TypeToken;
import com.threetaps.dto.geocoder.GeocoderRequest;
import com.threetaps.dto.geocoder.GeocoderResponse;

public class GeocoderClient extends Client {

	private static GeocoderClient instance;

	private GeocoderClient() {}

	public synchronized static GeocoderClient getInstance() {
		if (instance == null) instance = new GeocoderClient();
		return instance;
	}

	public List<GeocoderResponse> geocode(List<GeocoderRequest> geocoderRequests) throws IOException {

		final Map<String, String> params = new HashMap<String, String>();
		params.put("data", gson.toJson(geocoderRequests, new TypeToken<List<GeocoderRequest>>() {}.getType()));

		final HttpResponse response = this.executeGet("/geocoder/geocode/", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		@SuppressWarnings("unchecked")
		final List<List<String>> responseLists = (List<List<String>>)gson.fromJson(responseString,
				new TypeToken<List<List<String>>>() {}.getType());

		final List<GeocoderResponse> geocoderResponses = new ArrayList<GeocoderResponse>();

		for (List<String> responseList: responseLists) {
			final GeocoderResponse geocoderResponse = new GeocoderResponse();
			geocoderResponse.setCode(responseList.get(0));
			geocoderResponse.setLatitude(new Float(responseList.get(1)));
			geocoderResponse.setLongitude(new Float(responseList.get(2)));

			geocoderResponses.add(geocoderResponse);
		}

		return geocoderResponses;
	}

}
=end