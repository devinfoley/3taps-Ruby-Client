class PostingHistory < SuperModel::Base
  attributes :timestamp, :errors, :attrs
  def errors=(message)
    @attributes[:errors] = message || []
  end
 def attrs=(attrs)
   @attributes[:attrs] = attrs || {}
 end
end
