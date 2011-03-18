# Class ReferenceClient represents server request of reference API (provides a
# mechanism for accessing the standard "reference information" used by the
# 3taps system, including locations, categories, and sources).
#
# Its methods are used to query API with appropriate requests:
#  client = ReferenceClient.new
#  client.get_categories    # => returns array of Category objects
#  client.get_category(code)      # => returns Category object
#  client.get_locations  # => returns array of Location objects
#  client.get_sources     # => returns array of Source objects

class ReferenceClient < Client

  # Method +get_categories+ returns the 3taps categories.
  #
  # Example:
  #
  #  client.get_categories # => [Category, Category]
  #
  def get_categories
    response = execute_get("/reference/category")
    File.new("newfile",  "w+") << response
    Category.from_array(decode(response))
  end

  # Method +get_category+ returns a single category by passing in the category code.
  # Takes value of code objects as +String+ parameter.
  # 
  # Example:
  #
  #  client.get_category('NYC') # => Categoty
  #
  def get_category(code)
    response = execute_get("/reference/category/" + code)
    Category.new(decode(response)[0])
  end

  # Method +get_locations+ returns the 3taps locations.
  #
  # Example:
  #
  #  client.get_locations # => [Location, Location]
  #
  def get_locations
    response = execute_get("/reference/location")
    Location.from_array(decode(response))
  end

  # Method +get_sources+ returns the 3taps sources.
  #
  # Example:
  #
  #  client.get_sources # => [Source, Source]
  #
  def get_sources
    response = execute_get("/reference/source")
    Source.from_array(decode(response))
  end
end