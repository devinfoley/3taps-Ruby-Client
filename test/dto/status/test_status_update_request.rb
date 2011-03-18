require 'helper'

class TestStatusUpdateRequest < Test::Unit::TestCase
  should "Test update status request methods" do
    posting = Posting.new(:externalID => "1234567890", :source => '3TAPS')
    assert_equal "source:'3TAPS', externalID:1234567890", posting.to_json_for_status_client
    assert_equal StatusUpdateRequest, posting.status.class
    assert_equal Array, posting.status.errors.class
    assert_equal Hash, posting.status.attributes.class

    error = Message.new(:code => 666, :message => "UFO posting error")
    posting.status.errors << error
    posting.status.attributes = {:postKey => "TESTKEY", :message => "UFO test message"}
    posting.status.event = 'lost'
    assert_equal String, posting.status.to_params.class
  end

end
