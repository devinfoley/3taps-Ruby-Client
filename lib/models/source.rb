class Source < SuperModel::Base
  attributes :name, :code, :logoURL, :logoSmallURL

  def self.from_array(array)
    array.collect do |element|
      Source.new(element)
    end
  end
end