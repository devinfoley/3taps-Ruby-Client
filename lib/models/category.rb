# Class Category represents structure:
#
#  category = Category.new
#  category.code # => +String+ - a unique 4-character code identifying this category within 3taps.
#  category.group # => +String+ - the name of the group of this category.
#  category.category # => +String+ - the name of the category.
#  category.hidden # => +Boolean+ - if true, this category should be hidden from the user-interface.
#  category.annotations # => +Array+ - an array of +Annotation+ objects
#
# Its method are used to query API with appropriate requests:
# 
# category.from_array(array) - returns array of Category objects
#
class Category < Struct.new(:group, :category, :code, :annotations, :hidden)
  include HashedInitializer

  #ActiveSupport::JSON
  # Method +from_array+ returns array of categories.
  # Takes value of array objects as json parameter array.
  #
  # Example:
  #
  #  client.get_category('NYC') # => Categoty
  #
  def self.from_array(array)
    array.collect do |element|
      Category.new(element)
    end
  end
end
