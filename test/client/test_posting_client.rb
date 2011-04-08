require 'helper'

class TestPostingClient < Test::Unit::TestCase
  should "test single posting creation and deletion" do
    keys = []
    client = PostingClient.new
    posting = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting",
      :location => "ZZZ",
      :category => "ZZZZ",
      :timestamp => Time.now
    )
    response = client.create_posting(posting)
    assert_equal Array, response.class
    assert_equal CreateResponse, response.first.class
    assert_nil response.first.error
    posting_key = response.first.post_key
    p posting_key
#    posting.heading = "Svitla posting +++#{rand(100)}+++"
#    posting.postKey = posting_key
#    posting.body = "posting"
#   # sleep(50)
#    response = client.update_posting(posting)
#    p response
#    assert_equal true, response.success
#
#    keys << posting_key
#
#    posting = Posting.new(
#      :source => "3TAPS",
#      :heading => "Svitla posting",
#      :location => "ZZZ",
#      :category => "ZZZZ",
#      :timestamp => Time.now
#    )
#    response = client.create_posting(posting)
#    assert_equal Array, response.class
#    assert_equal CreateResponse, response.first.class
#    assert_nil response.first.error
#    posting_key = response.first.post_key
#    keys << posting_key
    p "waiting while indexed by server"
    sleep(10)
    response = client.delete_posting(posting_key)
    assert_equal DeleteResponse, response.class
    assert_equal true, response.success
  end

  should "test multiple postings creation and deletion" do
    client = PostingClient.new
    posting1 = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting1",
      :location => "ZZZ",
      :category => "ZZZZ",
      :timestamp => Time.now
    )
    posting2 = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting2",
      :location => "ZZZ",
      :category => "ZZZZ"
    )
    response = client.create_posting([posting1, posting2])
    p response
    assert_equal Array, response.class
    assert_equal CreateResponse, response.first.class
    assert_nil response.first.error
    p "waiting while indexed by server"
    sleep(15)
    posting_key = response[0].post_key
    posting1.postKey = posting_key
    posting_key = response[1].post_key
    posting2.postKey = posting_key
    posting1.body = "posting1"
    posting2.body = "posting2"
    response = client.update_posting([posting1, posting2])
    assert_equal true, response.success

    keys = [posting1.postKey, posting2.postKey]
    response = client.delete_posting(keys)
    assert_equal DeleteResponse, response.class
    assert_equal true, response.success
  end

  should "test posting retrieval" do
    client = PostingClient.new
    posting = client.get_posting("BLQ7YJD")
    assert_equal Posting, posting.class
    assert_equal "BLQ7YJD", posting.postKey
  end

  should "test posting deletion" do
    client = PostingClient.new
    result = client.delete_posting('post_key')
    assert_equal DeleteResponse, result.class
  end
end
