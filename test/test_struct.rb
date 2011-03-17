require 'helper'

class TestStruct < Test::Unit::TestCase
  should "create struct from hash" do
    class MyClass < Struct.new(:name, :id)

    end

    o = MyClass.from_hash(:name => "name", :id => 1)
    assert_equal "name", o.name
    assert_equal 1, o.id

    o2 = MyClass.from_hash("name" => "name", "id" => 1)
    assert_equal "name", o2.name
    assert_equal 1, o2.id
  end
end
