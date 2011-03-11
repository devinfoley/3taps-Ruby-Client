require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostingClient do
  before(:each) do
    @posting_client = PostingClient.new
  end

  it "should return Posting object" do
    Curl::Easy.stub!(:new).and_return mock("Request", :perform => nil, :body_str => "")
    ActiveSupport::JSON.stub!(:decode).and_return []
    @posting_client.get_posting("").is_a?(Posting).should be_true
  end
end

