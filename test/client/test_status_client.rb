require 'helper'

class TestStatusClient < Test::Unit::TestCase
  should "test update status" do
    
  end

  should "test get status" do
    res = GetRequest.new
    posting = []
    res.source = 'CRAIG'
    res.externalID= 3434399120
    posting << res
    res.source = 'CRAIG'
    res.externalID = 33334399121
    posting << res
    client = StatusClient.new
    get_response = client.get_status(posting)
    assert_equal GetResponse, get_response.class
  end

  should "test system status" do
    client = StatusClient.new
    status_response = client.system_status
    assert_equal Message, status_response.class
  end
end
