# Class Category represents structure of category:
#
#  category = Category.new
#  category.code        # => String
#  category.group       # => String
#  category.category    # => String
#  category.hidden      # => Boolean
#  category.annotations # => Array of Annotation objects

#  category.from_array(array) # =>  Array of Category objects
#
class Category < Struct.new(:group, :category, :code, :annotations, :hidden)

  # Method +from_array+ returns array of categories(create from json).
  # Takes value of array objects as json parameter array.
  #
  # Example:
  #
  #  Category.from_array([...array of JSON objects...]) # => Array of Category
  #
  def self.from_array(array)
    array.collect do |element|
      Category.new(element)
    end
  end
end
