class StatusClient < Client

  def update_status(posting)
    params = "data=#{posting}"
    response = execute_get("/status/update", params)
    ActiveSupport::JSON.decode(response)
  end

  def get_status(posting)
    params = "data=#{posting}"
    response = execute_get("/status/get", params)
    ActiveSupport::JSON.decode(response)
  end

  def system_status()
    response = execute_get("/status/system")
    ActiveSupport::JSON.decode(response)
  end

end