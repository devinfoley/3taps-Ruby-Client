class Location < SuperModel::Base
  attributes :countryRank, :country, :cityRank, :city, :stateCode, :stateName, :code, :latitude, :longitude

  def self.from_json(json)
    res = []

    json.each do |location|
      res << Location.new({
          :group       => location["group"],
          :category    => location["category"],
          :code        => location["code"],
          :countryRank => location["countryRank"],
          :country     => location["country"],
          :cityRank    => location["cityRank"],
          :city        => location["city"],
          :stateCode   => location["stateCode"],
          :stateName   => location["stateName"],
          :latitude    => location["latitude"],
          :longitude   => location["longitude"]
        })
    end
    res
  end
end
