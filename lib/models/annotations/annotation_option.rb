# Class AnnotationOption represents structure of options
#
#  option = AnnotationOption.new
#  option.value          # => String
#  option.sub_annotation # => String
#
class AnnotationOption < SuperModel::Base
  attributes :value, :sub_annotation
end
