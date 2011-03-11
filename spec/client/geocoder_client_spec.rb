require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GeocoderClient do
  before(:each) do
    @geocoder_client = GeocoderClient.new
  end

  it "should send GET request and create GeocoderResponse from result" do
    geocoder_response = mock "geocoder_response"
    ActiveSupport::JSON.should_receive(:decode)
    GeocoderResponse.should_receive(:from_json).and_return geocoder_response
    @geocoder_client.geocode("").should == geocoder_response
  end
end

