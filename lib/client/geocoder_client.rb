class GeocoderClient < Client

  def geocode(string)
    params = "data=#{string}"
    response = execute_get('geocoder/geocode', params)
    GeocoderResponse.from_json(ActiveSupport::JSON.decode(response))
  end

end