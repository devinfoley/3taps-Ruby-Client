class Category < SuperModel::Base
  attributes :group, :category, :code, :annotations
  def annotations=(annotations)
    @attributes[:annotations] = annotations || []
  end
end
