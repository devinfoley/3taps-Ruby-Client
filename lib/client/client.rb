# Base class for 3taps API client classes.
class Client
  DEFAULT_URL = 'http://3taps.net'
  DEFAULT_API_PORT = 80
  TIMEOUT = 15
  # Initializes Client class with +baseUrl+ and +port+ parameters. By default 
  # DEFAULT_URL and DEFAULT_API_PORT are used. Examples:
  #  Client.new
  #  Client.new("http://3taps.com", 8080)
  def initialize(baseUrl = DEFAULT_URL, port = DEFAULT_API_PORT)
    @baseURL = baseUrl
    @port = port
  end

  # Executes GET request on URL and port with +path+ and +params+ parameters.
  # Example:
  #
  #  execute_get("/search", "data=data")
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

  # Executes POST request on URL and port with +path+ and +params+ parameters.
  # Example:
  #
  #  execute_post("search", "data=data")
  def execute_post( path, params = nil )
    c = Curl::Easy.new("#{@baseURL}:#{@port}/#{path}")
    param, data = params.split("=",2)
    c.http_post(param.to_s + '=' + c.escape(data.to_s))
    c.body_str
  end

  private

  def decode(data)
    ActiveSupport::JSON.decode(data)
  end
end
