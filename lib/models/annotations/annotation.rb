class Annotation < SuperModel::Base
  attributes :name, :annotationType, :options
  def options=(options)
    @attributes[:options] = options || []
  end
  class AnnotaionType
    SELECT = 1
    STRING = 2
    NUMBER = 3
  end
end
