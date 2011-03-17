#The Reference API provides a mechanism for accessing the standard
#"reference information" used by the 3taps system, including locations,
#categories, and sources.
class ReferenceClient < Client
  
  #Returns the 3taps categories
  def get_categories
    response = execute_get("/reference/category")
    File.new("newfile",  "w+") << response
    Category.from_array(decode(response))
  end

  #You can request a single category by passing in the category code
  def get_category(category_code)
    response = execute_get("/reference/category/" + category_code)
    Category.new(decode(response)[0])
  end

  #Returns the 3taps locations
  def get_locations
    response = execute_get("/reference/location")
    Location.from_array(decode(response))
  end

  #Returns the 3taps sources
  def get_sources
    response = execute_get("/reference/source")
    Source.from_array(decode(response))
  end
end