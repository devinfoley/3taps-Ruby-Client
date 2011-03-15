require 'helper'

class TestStatusClient < Test::Unit::TestCase
  should "test update status" do
    
  end

  should "test get status" do
    posting_client = PostingClient.new
    posting = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting",
      :timestamp => Time.now
    )
    response = posting_client.create_posting(posting)
    first_key = response.first.postKey
    existing_posting =  posting_client.get_posting(first_key)
    client = StatusClient.new
    response = client.get_status(existing_posting)
    assert_equal GetResponse, response.class
  end

  should "test system status" do
    client = StatusClient.new
    status_response = client.system_status
    assert_equal Message, status_response.class
  end
end
