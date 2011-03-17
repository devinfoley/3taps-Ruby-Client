class PostingHistory < Struct.new(:timestamp, :errors, :attrs)
  include HashedInitializer
end
