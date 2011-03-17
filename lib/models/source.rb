class Source < Struct.new(:name, :code, :logo_url, :logo_sm_url, :hidden)
  include HashedInitializer
  
  def self.from_array(array)
    array.collect do |element|
      Source.new(element)
    end
  end
end