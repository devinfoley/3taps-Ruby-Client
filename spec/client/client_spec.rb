require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  before(:each) do
    @client = Client.new
  end

  it "should decode data" do
    data = mock "[]"
    ActiveSupport::JSON.should_receive(:decode).with(data)
    @client.send(:decode,data)
  end

  it "should desc" do
    # TODO
  end
end

