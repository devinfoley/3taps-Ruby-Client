class ReferenceClient < Client

  def get_categories()
    response = execute_get("/reference/category")
    ActiveSupport::JSON.decode(response)
  end

  def get_category(category_code)
    response = execute_get("/reference/category/" + category_code)
    ActiveSupport::JSON.decode(response)
  end

  def get_locations()
    response = execute_get("/reference/location")
    ActiveSupport::JSON.decode(response)
  end

  def get_sources()
    response = execute_get("/reference/source")
    ActiveSupport::JSON.decode(response)
  end

end

=begin
package com.threetaps.client;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.google.gson.reflect.TypeToken;
import com.threetaps.model.Category;
import com.threetaps.model.Location;
import com.threetaps.model.Source;

public class ReferenceClient extends Client {

	private static ReferenceClient instance;

	private ReferenceClient() {};

	public synchronized static ReferenceClient getInstance() {
		if (instance == null) instance = new ReferenceClient();
		return instance;
	}

	public List<Category> getCategories() throws IOException {

		final HttpResponse response = this.executeGet("/reference/category");
		final String responseString = EntityUtils.toString(response.getEntity());

		final Type type = new TypeToken<Collection<Category>>() {}.getType();

		@SuppressWarnings("unchecked")
		final List<Category> categories = (List<Category>)gson.fromJson(responseString, type);
		return categories;
	}

	public Category getCategory(String categoryCode) throws IOException {

		final HttpResponse response = this.executeGet("/reference/category/" + categoryCode);
		final String responseString = EntityUtils.toString(response.getEntity());

		final Type type = new TypeToken<Collection<Category>>() {}.getType();

		@SuppressWarnings("unchecked")
		final List<Category> categories = (List<Category>)gson.fromJson(responseString, type);

		return (categories.size() < 1) ? null : categories.get(0);
	}

	public List<Location> getLocations() throws IOException {

		final HttpResponse response = this.executeGet("/reference/location");
		final String responseString = EntityUtils.toString(response.getEntity());

		final Type type = new TypeToken<Collection<Location>>() {}.getType();

		@SuppressWarnings("unchecked")
		final List<Location> locations = (List<Location>)gson.fromJson(responseString, type);
		return locations;
	}

	public List<Source> getSources() throws IOException {

		final HttpResponse response = this.executeGet("/reference/source", null);
		final String responseString = EntityUtils.toString(response.getEntity());

		final Type type = new TypeToken<Collection<Location>>() {}.getType();

		@SuppressWarnings("unchecked")
		final List<Source> sources = (List<Source>)gson.fromJson(responseString, type);
		return sources;
	}
}
=end