class ReferenceClient < Client
  def get_categories
    response = execute_get("/reference/category")
    Category.from_json(decode(response))
  end

  def get_category(category_code)
    response = execute_get("/reference/category/" + category_code)
    Category.new(decode(response)[0])
  end

  def get_locations
    response = execute_get("/reference/location")
    Location.from_json(decode(response))
  end

  def get_sources
    response = execute_get("/reference/source")
    Source.from_json(decode(response))
  end
end