require 'helper'

class TestStruct < Test::Unit::TestCase
  class MyClass < Struct.new(:name, :id); end

  should "create struct from hash with symbol keys" do
    o = MyClass.from_hash(:name => "name", :id => 1)
    assert_equal "name", o.name
    assert_equal 1, o.id
  end

  should "create struct from hash with string keys" do
    o = MyClass.from_hash("name" => "name", "id" => 1)
    assert_equal "name", o.name
    assert_equal 1, o.id
  end
end
