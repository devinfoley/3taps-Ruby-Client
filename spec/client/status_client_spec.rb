require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatusClient do
  before(:each) do
    @status_client = StatusClient.new
  end

  it "should send POST request and create Message from result" do
    stub_post_and_json_decode
    posting = mock "posting"
    message = mock "message"
    status_update_request = mock "status_update_request"
    Message.should_receive(:new).and_return message
    posting.should_receive(:status).and_return status_update_request
    status_update_request.should_receive(:event).and_return ""

    @status_client.update_status(posting).should == message
  end

  it "should send POST request and create GetResponse from result" do
    stub_post_and_json_decode
    postings = mock "posting"
    postings.should_receive(:to_json_for_status_client)
    get_response = mock "get_status_response"
    GetStatusResponse.should_receive(:new).and_return get_response

    @status_client.get_status(postings).should == get_response
  end

  it "should send GET request and create Message from result" do
    stub_get_and_json_decode
    message = mock "message"
    Message.should_receive(:new).and_return message

    @status_client.system_status.should == message
  end

end

