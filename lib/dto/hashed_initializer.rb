module HashedInitializer
  def initialize(hash = {})
    hash.each do |key, value|
      self.send("#{key}=".to_sym, value)
    end
  end
end
