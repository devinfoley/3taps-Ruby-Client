#private Boolean exists;
#private String postKey;
#private Message error;
class ExistsResponse
  attr_accessor :exists, :postKey, :error

  def self.from_json(json)
   json
  end
end
