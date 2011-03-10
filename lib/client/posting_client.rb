class PostingClient < Client

  def get_posting(post_key)
    response = execute_get("/posting/get/" + post_key)
    ActiveSupport::JSON.decode(response)
  end

  def create_posting(posting)
    params = "posts=#{posting}"
    response = execute_post("/posting/create", params)
    ActiveSupport::JSON.decode(response)
  end

  def update_posting(posting)
    params = "data=#{posting}"
    response = execute_post("/posting/update", params)
    ActiveSupport::JSON.decode(response)
  end

  def delete_posting(post_key)
    params = "data=#{CGI.escape(ActiveSupport::JSON.encode([post_key]))}"
    response = execute_post("/posting/delete", params)
    ActiveSupport::JSON.decode(response)
  end

  def exists(posting)
    params = "ids=#{posting}"
    response = execute_post("/posting/exists", params)
    ActiveSupport::JSON.decode(response)
  end
  
end

=begin
package com.threetaps.client;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.google.gson.reflect.TypeToken;
import com.threetaps.dto.posting.CreateResponse;
import com.threetaps.dto.posting.DeleteResponse;
import com.threetaps.dto.posting.UpdateResponse;
import com.threetaps.model.Posting;

public class PostingClient extends Client {

	private static PostingClient instance;

	private PostingClient() {};

	public synchronized static PostingClient getInstance() {
		if (instance == null) instance = new PostingClient();
		return instance;
	}

	public Posting get(String postKey) throws IOException {

		final HttpResponse response = this.executeGet("/posting/get/" + postKey, null);
		final String responseString = EntityUtils.toString(response.getEntity());

		return (Posting)gson.fromJson(responseString, Posting.class);
	}

	public List<CreateResponse> create(List<Posting> postingsToCreate) throws IOException {
		final Map<String, String> params = new HashMap<String, String>();
		params.put("postings", gson.toJson(postingsToCreate, new TypeToken<Collection<Posting>>() {}.getType()));

		final HttpResponse response = this.executePost("/posting/create", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		@SuppressWarnings("unchecked")
		final List<CreateResponse> createResponses = (List<CreateResponse>)gson.fromJson(responseString,
				new TypeToken<Collection<CreateResponse>>() {}.getType());
		return createResponses;
	}

	/**
	 * The update method differs a bit from our API protocol, as it's not very friendly for type-safe languages.
	 *
	 * @param postingsToUpdate a list of posting objects to be updated. Each posting object must have a postKey. The other
	 * fields of the posting are optional. Each included posting field will be used to override the values for that posting
	 * currently in 3taps.
	 * @return
	 * @throws IOException
	 */
	public UpdateResponse update(List<Posting> postingsToUpdate) throws IOException {

		final List<List<Object>> updateParam = new ArrayList<List<Object>>();
		for (Posting posting : postingsToUpdate) {
			final List<Object> postingList = new ArrayList<Object>();

			postingList.add(posting.getPostKey());
			posting.setPostKey(null);
			postingList.add(posting);

			updateParam.add(postingList);
		}

		final Map<String, String> params = new HashMap<String, String>();
		params.put("data", gson.toJson(updateParam, new TypeToken<Collection<Collection<Object>>>() {}.getType()));

		final HttpResponse response = this.executePost("/posting/update", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		return (UpdateResponse)gson.fromJson(responseString, UpdateResponse.class);
	}

	public DeleteResponse delete(List<String> postKeysToDelete) throws IOException {

		final Map<String, String> params = new HashMap<String, String>();
		params.put("data", gson.toJson(postKeysToDelete, new TypeToken<Collection<String>>() {}.getType()));

		final HttpResponse response = this.executePost("/posting/delete", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		return (DeleteResponse)gson.fromJson(responseString, DeleteResponse.class);
	}

	@Deprecated
	public List<Posting> exists(List<Posting> postingsToCheck) throws IOException {

		final Type type = new TypeToken<Collection<Posting>>() {}.getType();

		final Map<String, String> params = new HashMap<String, String>();
		params.put("ids", gson.toJson(postingsToCheck, type));

		final HttpResponse response = this.executePost("/posting/exists", params);
		final String responseString = EntityUtils.toString(response.getEntity());

		@SuppressWarnings("unchecked")
		final List<Posting> postings = (List<Posting>)gson.fromJson(responseString, type);
		return postings;
	}
}
=end
