# Class Annotation represents structure of annotation
#
#  annotation = Annotation.new
#  annotation.name            # => String
#  annotation.annotation_type # => String
#  annotation.options         # => Array of AnnotationOption objects
#
class Annotation < SuperModel::Base
  attributes :name, :annotation_type, :options

  # Class AnnotaionType represents container of constants of annotation types:
  #  SELECT = 1
  #  STRING = 2
  #  NUMBER = 3
  #
  class AnnotaionType
    SELECT = 1
    STRING = 2
    NUMBER = 3
  end
end