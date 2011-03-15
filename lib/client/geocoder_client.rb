class GeocoderClient < Client

  def geocode(string)
    params = "data=#{string}"
    response = execute_post('geocoder/geocode', params)
    GeocoderResponse.from_json(decode(response))
  end

end