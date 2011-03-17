class Category < Struct.new(:group, :category, :code, :annotations)
  include HashedInitializer
  
  def self.from_array(array)
    array.collect do |element|
      Category.new(element)
    end
  end
end
