class GeocoderRequest < Struct.new(:latitude, :longitude, :country, :state, :city, :locality, :postal, :text)

  def to_params
    result = []
    result << "\"latitude\":#{CGI.escape latitude}" unless latitude.nil?
    result << "\"longitude\":#{CGI.escape longitude}" unless longitude.nil?
    result << "\"country\":\"#{CGI.escape country}\"" unless country.nil?
    result << "\"state\":\"#{CGI.escape state}\"" unless state.nil?
    result << "\"city\":\"#{CGI.escape city}\"" unless city.nil?
    result << "\"locality\":\"#{CGI.escape locality}\"" unless locality.nil?
    result << "\"postal\":\"#{CGI.escape postal}\"" unless postal.nil?
    result << "\"tex\":\"#{CGI.escape text}\"" unless text.nil?
    '{' + result.join(", ") + '}'
  end

end
