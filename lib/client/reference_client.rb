class ReferenceClient < Client

  def get_categories()
    response = execute_get("/reference/category")
    ActiveSupport::JSON.decode(response)
  end

  def get_category(category_code)
    response = execute_get("/reference/category/" + category_code)
    ActiveSupport::JSON.decode(response)
  end

  def get_locations()
    response = execute_get("/reference/location")
    ActiveSupport::JSON.decode(response)
  end

  def get_sources()
    response = execute_get("/reference/source")
    ActiveSupport::JSON.decode(response)
  end

end