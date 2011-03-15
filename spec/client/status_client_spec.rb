require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatusClient do
  before(:each) do
    @status_client = StatusClient.new
  end

  it "should desc" do
    # TODO
  end

  it "should send POST request and create GetResponse from result" do
    status_request = mock "status_request"
    status_request.should_receive(:to_json)
    status_response = mock "status_response"
    GetResponse.should_receive(:from_json).and_return status_response

    @status_client.get_status(status_request).should == status_response
  end

  it "should send GET request and create Message from result" do
    status_response = mock "status_response"
    Message.should_receive(:from_json).and_return status_response

    @status_client.system_status().should == status_response
  end

end

