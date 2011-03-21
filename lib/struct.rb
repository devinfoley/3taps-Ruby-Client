class Struct
  
  def self.from_hash(h)
    o = new
    h.each do |m, v|
      o[m.to_sym] = v
    end
    o
  end

  def self.from_array(a)
    a.collect do |b|
    end
  end

end
