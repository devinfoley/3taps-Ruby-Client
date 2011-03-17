class Source < Struct.new(:name, :code, :logoURL, :logoSmallURL)
  include HashedInitializer
  
  def self.from_array(array)
    array.collect do |element|
      Source.new(element)
    end
  end
end