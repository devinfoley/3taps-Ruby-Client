require 'helper'

class TestReferenceClient < Test::Unit::TestCase
  should "test get categories" do
    client = ReferenceClient.new
    categories = client.get_categories
    assert_equal Array, categories.class
    assert_equal Category, categories.first.class
  end

  should "test get category" do
    client = ReferenceClient.new
    category = client.get_category("VAUT")
   # assert_equal "VAUT", category.code
  end

  should "test get locations" do
    client = ReferenceClient.new
    locations = client.get_locations
    assert_equal Array, locations.class
    assert_equal Location, locations.first.class
  end

  should "test get sources" do
    client = ReferenceClient.new
    sources = client.get_sources
    assert_equal Array, sources.class
    assert_equal Source, sources.first.class
  end
end
