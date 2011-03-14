class ReferenceClient < Client

  def get_categories()
    response = execute_get("/reference/category")
    Category.from_json(ActiveSupport::JSON.decode(response))
  end

  def get_category(category_code)
    response = execute_get("/reference/category/" + category_code)
    Category.from_json(ActiveSupport::JSON.decode(response))
  end

  def get_locations()
    response = execute_get("/reference/location")
    Location.from_json(ActiveSupport::JSON.decode(response))
  end

  def get_sources()
    response = execute_get("/reference/source")
    Source.from_json(ActiveSupport::JSON.decode(response))
  end

end