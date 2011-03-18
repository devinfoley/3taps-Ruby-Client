#Class GeocoderClient represents server request of geocoding API (calculate
#the location to use for a posting based on location-specific details within
#the posting such as a street address or a latitude and longitude value).

class GeocoderClient < Client
  #Its methods are used to query API with appropriate requests:
  # geocode(geocoder_requests) - returns array of responses
  #
  #Example:
  #
  # client = GeocoderClient.new
  # request = GeocoderRequest.new
  # request.latitude = '37.77493'
  # request.longitude = '-122.41942'
  #
  # response = client.geocode(request)
  #
  # response.first.code => "CAZ"
  # response.first.latitude => 39.77493
  # response.first.longitude => -122.41942
  def geocode(geocoder_requests)
    geocoder_requests = [geocoder_requests] unless geocoder_requests.is_a? Array
    params = "data=["
    params << geocoder_requests.collect{|request| "#{request.to_params}"}.join(',')
    params << "]"
    response = execute_post('geocoder/geocode', params)
    GeocoderResponse.from_array(decode(response))
  end
end