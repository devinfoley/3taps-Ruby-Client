class Message < SuperModel::Base
  attributes :code, :message

def self.from_json(json)
    result = self.new
    result.code = json["code"]
    result.message = json["message"]  
    result
  end
end
