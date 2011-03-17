class Struct
  def from_hash(h)
    o = new
    members.each {|m| o[m] = h[m]}
    o
  end
end
