require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatusClient do
  before(:each) do
    @status_client = StatusClient.new
  end

  it "should desc" do
    # TODO
  end

  it "should send POST request and create GetResponse from result" do
    stub_post_and_json_decode
    GetResponse.should_receive(:from_json).with([])
    post = mock "Posting" , :to_json_for_status=>""
    @status_client.get_status(post).class == GetResponse.class#).should be_true
  end

  it "should send GET request and create Message from result" do
    stub_get_and_json_decode
    @status_client.system_status.is_a?(Message).should be_true
  end

end

