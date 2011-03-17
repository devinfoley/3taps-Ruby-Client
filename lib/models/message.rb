class Message < Struct.new(:code, :message)
  include HashedInitializer
end
