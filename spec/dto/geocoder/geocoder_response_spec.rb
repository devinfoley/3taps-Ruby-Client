require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
describe GeocoderResponse do
  #before(:each) do
  #    @geocoder_response = Geocoder.new
  #end
  it "should initialize multiple objects form array" do
    array = [1,2,3]
    array.size.times do
      GeocoderResponse.should_receive(:from_hash)
    end
    GeocoderResponse.from_array(array)
  end

end