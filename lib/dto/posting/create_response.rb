class CreateResponse < Struct.new(:postKey, :error) do
    def post_key
      postKey
    end
  end
  include HashedInitializer

  def self.from_array(array)
    array.collect do |element|
      CreateResponse.new(element)
    end
  end
end
