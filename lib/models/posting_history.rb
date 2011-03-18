# Class PostingHistory represents structure of history
#
#  history = PostingHistory.new
#  history.history # => String
#
class PostingHistory < Struct.new(:history)
 #include HashedInitializer
end
