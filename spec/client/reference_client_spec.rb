require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReferenceClient do
  before(:each) do
    @reference_client = ReferenceClient.new
  end

  it "should send GET request and create Categories array from result" do
    categories_response = mock "categories_array"
    Category.should_receive(:from_json).and_return categories_response

    @reference_client.get_categories.should == categories_response
  end

  it "should send GET request and create Category from result" do
    category_response = mock "category"
    category_code = mock "category_code"
    Category.should_receive(:from_json).and_return category_response

    @reference_client.get_category(category_code).should == category_response
  end

  it "should send GET request and create Locations array from result" do
    locations_response = mock "locations_array"
    Location.should_receive(:from_json).and_return locations_response

    @reference_client.get_locations.should == locations_response
  end

  it "should send GET request and create Sources array from result" do
    sources_response = mock "sources_array"
    Source.should_receive(:from_json).and_return sources_response

    @reference_client.get_sources.should == sources_response
  end

end
