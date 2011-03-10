class SearchResponse
  attr_accessor :success, :num_results, :exec_time_ms, :results

  def self.from_json(json)
    res = self.new
    res.success = json["success"]
    res.num_results = json["numResults"]
    res.exec_time_ms = json["execTimeMs"]
    res.results = []
    json["results"].each do |posting|
        res.results << Posting.new({
        :postKey     => posting["postKey"],
        :heading     => posting["heading"],
        :body        => posting["body"], 
        :category    => posting["category"], 
        :source      => posting["source"], 
        :location    => posting["location"],
        :longitude   => posting["longitude"], 
        :latitude    => posting["latitude"], 
        :language    => posting["language"],
        :price       => posting["price"],
        :currency    => posting["currency"],
        :externalURL => posting["externalURL"], 
        :externalID  => posting["externalID"], 
        :accountName => posting["accountName"], 
        :accountID   => posting["accountID"],
        :timestamp   => posting["timestamp"], 
        :expires     => posting["expires"],
        :indexed     => posting["indexed"], 
        :exists      => posting["exists"], 
        :status      => posting["status"],
        :annotations => posting["annotations"], 
        :errors      => posting["errors"], 
        :history     => posting["history"]                                    
        })
    end    
    res
  end

end
