require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GeocoderClient do
  before(:each) do
    @geocoder_client = GeocoderClient.new
  end

  it "should send GET request and create GeocoderResponse from result" do
    geocoder_param = ""
    geocoder_response = mock "geocoder_response"
    ActiveSupport::JSON.should_receive(:encode).with({:data => geocoder_param})
    ActiveSupport::JSON.should_receive(:decode)
    GeocoderResponse.should_receive(:from_array).and_return geocoder_response
    @geocoder_client.geocode(geocoder_param).should == geocoder_response
  end
end

