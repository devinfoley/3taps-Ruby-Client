class Struct
  def from_hash(h)
    o = new
    members.each {|m| o[m.to_sym] = h[m]}
    o
  end
end
