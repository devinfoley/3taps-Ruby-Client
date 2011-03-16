class Category < SuperModel::Base
  attributes :group, :category, :code, :annotations
  def annotations=(annotations)
    @attributes[:annotations] = annotations || []
  end

  def self.from_array(array)
    array.collect do |element|
      Category.new(element)
    end
  end
end
