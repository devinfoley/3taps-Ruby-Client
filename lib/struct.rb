class Struct
  def self.from_hash(h)
    o = new
    h.each_pair{ |m, v| o[m.to_sym] = v }
    o
  end
end
