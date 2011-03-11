class Annotation < SuperModel::Base
  attributes :name, :annotation_type, :options
  def initialize
    @attributes[:options] = []
  end
  
  class AnnotaionType
    SELECT = 1
    STRING = 2
    NUMBER = 3
  end
end
