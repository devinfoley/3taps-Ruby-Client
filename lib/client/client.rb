class Client
  DEFAULT_URL = 'http://3taps.net'
  DEFAULT_API_PORT = 80
  def initialize(baseUrl = DEFAULT_URL, port = DEFAULT_API_PORT)
    @baseURL = baseUrl
    @port = port
  end

  def execute_get( path, params = nil )
    address = params.nil? ? path : path + '?' + params 
    request = Curl::Easy.new("#{@baseURL}:#{@port}" + address)
    begin
      request.perform
    rescue
      "Some Error with Request."
    end
    request.body_str
  end

  def execute_post( path, params = nil )
    c = Curl::Easy.http_post("{@baseURL}:#{@port}/#{path}",params) do |curl|
      curl.headers['Accept'] = 'application/json'
      curl.headers['Content-Type'] = 'application/json'
      curl.headers['Api-Version'] = '2.2'
    end
    ActiveSupport::JSON.decode(c.body_str)
  end

  #private HttpClient httpClient = new DefaultHttpClient();;

  #protected Gson gson = new GsonBuilder().setDateFormat(Constants.DATE_FORMAT)


	#protected Client() {

	#protected HttpResponse execute(HttpUriRequest request) throws ClientProtocolException, IOException {


	#protected HttpResponse executeGet(String endpoint) throws ClientProtocolException, IOException {

	#protected HttpResponse executeGet(String endpoint, Map<String, String> params) throws ClientProtocolException,



	#protected HttpResponse executePost(String endpoint, Map<String, String> params) throws ClientProtocolException,
	
end

=begin
package com.threetaps.client;

import java.io.IOException;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.threetaps.util.Constants;
import com.windriver.gson.extension.GeneralObjectDeserializer;

public abstract class Client {

	protected static Logger logger = Logger.getLogger(Client.class.getName());

	private static String DEFAULT_URL = Constants.DEFAULT_API_URL;
	private static int DEFAULT_PORT = Constants.DEFAULT_API_PORT;

	protected String baseURL;
	protected int port;

	private HttpClient httpClient = new DefaultHttpClient();;

	protected Gson gson = new GsonBuilder().setDateFormat(Constants.DATE_FORMAT)
		.excludeFieldsWithModifiers(Modifier.TRANSIENT)
		.registerTypeAdapter(Map.class, new GeneralObjectDeserializer()).create();

	protected Client() {
		this(DEFAULT_URL, DEFAULT_PORT);
	}

	protected Client(String url, int port) {

		this.baseURL = url;
		this.port = port;
	}

	protected HttpResponse execute(HttpUriRequest request) throws ClientProtocolException, IOException {
		logger.info(request.getURI().toString());
		return httpClient.execute(request);
	}

	protected HttpResponse executeGet(String endpoint) throws ClientProtocolException, IOException {
		return executeGet(endpoint, null);
	}

	protected HttpResponse executeGet(String endpoint, Map<String, String> params) throws ClientProtocolException,
			IOException {

		final List<NameValuePair> qparams = new ArrayList<NameValuePair>();
		if (params != null) {
			for (Map.Entry<String, String> param : params.entrySet()) {
				qparams.add(new BasicNameValuePair(param.getKey(), param.getValue()));
			}
		}

		final HttpGet request = new HttpGet(baseURL + endpoint + "?" + URLEncodedUtils.format(qparams, "UTF-8"));
		return execute(request);
	}

	protected HttpResponse executePost(String endpoint, Map<String, String> params) throws ClientProtocolException,
			IOException {

		final List<NameValuePair> qparams = new ArrayList<NameValuePair>();
		if (params != null) {
			for (Map.Entry<String, String> param : params.entrySet()) {
				qparams.add(new BasicNameValuePair(param.getKey(), param.getValue()));
				logger.info(param.getKey() + "=" + param.getValue());
			}
		}

		final HttpPost request = new HttpPost(baseURL + endpoint);
		request.setEntity(new UrlEncodedFormEntity(qparams, HTTP.UTF_8));

		return execute(request);
	}
}
=end