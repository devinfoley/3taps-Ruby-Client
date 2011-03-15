class Client
  DEFAULT_URL = 'http://3taps.net'
  DEFAULT_API_PORT = 80
  def initialize(baseUrl = DEFAULT_URL, port = DEFAULT_API_PORT)
    @baseURL = baseUrl
    @port = port
  end

  def execute_get( path, params = nil )
    address = params.nil? ? path : path + '?' + params 
    request = Curl::Easy.new("#{@baseURL}:#{@port}" + address) 
    begin
      request.perform
    rescue
      "Some Error with Request."
    end
    request.body_str
  end

  def execute_post( path, params = nil )
    c = Curl::Easy.http_post("#{@baseURL}:#{@port}/#{path}", params) do |curl|
      curl.headers['Accept'] = 'application/json'
      curl.headers['Content-Type'] = 'application/json'
      curl.headers['Api-Version'] = '2.2'
    end
    c.body_str
  end
  private
  def decode(data)
    ActiveSupport::JSON.decode(data)
  end
end
