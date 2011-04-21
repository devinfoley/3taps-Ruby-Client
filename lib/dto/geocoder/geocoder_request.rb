class GeocoderRequest < Struct.new(:latitude, :longitude, :country, :state, :city, :locality, :postal, :text)

  def to_params
    result = []
    result << "\"latitude\":#{latitude}" unless latitude.nil?
    result << "\"longitude\":#{longitude}" unless longitude.nil?
    result << "\"country\":\"#{country}\"" unless country.nil?
    result << "\"state\":\"#{state}\"" unless state.nil?
    result << "\"city\":\"#{city}\"" unless city.nil?
    result << "\"locality\":\"#{locality}\"" unless locality.nil?
    result << "\"postal\":\"#{postal}\"" unless postal.nil?
    result << "\"text\":\"#{text}\"" unless text.nil?
    '{' + result.join(", ") + '}'
  end

end
