class Source < SuperModel::Base
  attributes :name, :code, :logoURL, :logoSmallURL

  def self.from_json(json)
    res = []

    json.each do |source|
      res << Source.new({
          :name        => source["name"],
          :code        => source["code"],
          :logo_url    => source["logo_url"],
          :logo_sm_url => source["logo_sm_url"],
        })
    end
    res
  end
end
