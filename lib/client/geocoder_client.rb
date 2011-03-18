#Class GeocoderClient represents server request of geocoding API (calculate
#the location to use for a posting based on location-specific details within
#the posting such as a street address or a latitude and longitude value).
#
#Its methods are used to query API with appropriate requests:
#- geocode(geocoder_requests)
#
#Example:
#
#geocoder_client = GeocoderClient.new
#geocoder_request = GeocoderRequest.new
#geocoder_request.latitude = '37.77493'
#geocoder_request.longitude = '-122.41942'
#request = geocoder_request
#response = geocoder_client.geocode(request)

class GeocoderClient < Client

  def geocode(geocoder_requests)
    geocoder_requests = [geocoder_requests] unless geocoder_requests.is_a? Array
    params = "data=["
    params << geocoder_requests.collect{|request| "#{request.to_params}"}.join(',')
    params << "]"
    response = execute_post('geocoder/geocode', params)
    GeocoderResponse.from_array(decode(response))
  end
end