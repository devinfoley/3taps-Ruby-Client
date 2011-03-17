# The GeocoderClient refers to Geocoder API which is a web service within the
# 3taps Network that allows other programs (both external systems and other
# parts of the 3taps Network) to calculate the location to use for a posting
# based on location-specific details within the posting such as a street address
# or a latitude and longitude value. This process of calculating the location
# for a posting is known as geocoding.
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