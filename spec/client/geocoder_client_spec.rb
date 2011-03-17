require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GeocoderClient do
  before(:each) do
    @geocoder_client = GeocoderClient.new
  end

  it "should send GET request and create GeocoderResponse from result" do
    geocoder_request = mock "geocoder_request"
    geocoder_request.should_receive(:to_params)
    array = mock "array"
    geocoder_response = mock "geocoder_response"
    GeocoderResponse.should_receive(:from_array).and_return array

    @geocoder_client.geocode(geocoder_request).should == array
  end
end

