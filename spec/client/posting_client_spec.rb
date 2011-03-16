require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostingClient do
  before(:all) do
  end

  before(:each) do
    @posting_client = PostingClient.new
  end

  it "should return Posting object" do
    stub_get_and_json_decode
    @posting_client.get_posting("").is_a?(Posting).should be_true
  end

  # no spec for creation - see tests

  it "should return UpdateResponse object" do
    stub_post_and_json_decode
    UpdateResponse.should_receive(:from_array).with([])
    post = mock "Posting" , :to_json_for_update=>""
    @posting_client.update_posting(post).class == UpdateResponse.class#).should be_true
  end

  it "should return DeleteResponse object" do
    stub_post_and_json_decode
    DeleteResponse.should_receive(:new).with([])
    @posting_client.delete_posting("").class == DeleteResponse.class
  end

  it "should return boolean value" do
    stub_post_and_json_decode
    @posting_client.exists_posting(mock("")).should be_true
  end
end

