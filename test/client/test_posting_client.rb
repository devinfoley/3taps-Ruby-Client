require 'helper'

class TestPostingClient < Test::Unit::TestCase
  should "test single posting creation and deletion" do
    keys = []
    client = PostingClient.new
    posting = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting",
      :timestamp => Time.now
    )
    response = client.create_posting(posting)
    assert_equal Array, response.class
    assert_equal CreateResponse, response.first.class
    assert_nil response.first.error
    posting_key = response.first.post_key
    posting.heading = "change"
    posting.postKey = posting_key
    posting.body = "posting"

    response = client.update_posting(posting)
    assert_equal true, response.success

    keys << posting_key
    
    posting = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting",
      :timestamp => Time.now
    )
    response = client.create_posting(posting)
    assert_equal Array, response.class
    assert_equal CreateResponse, response.first.class
    assert_nil response.first.error
    posting_key = response.first.post_key

    keys << posting_key

    response = client.delete_posting(keys)
    assert_equal DeleteResponse, response.class
    assert_equal true, response.success
  end

  should "test multiple postings creation and deletion" do
    client = PostingClient.new
    posting1 = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting1",
      :timestamp => Time.now
    )
    posting2 = Posting.new(
      :source => "3TAPS",
      :heading => "Svitla posting2",
      :timestamp => Time.now
    )
    response = client.create_posting([posting1, posting2])
    assert_equal Array, response.class
    assert_equal CreateResponse, response.first.class
    assert_nil response.first.error

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
    posting = client.get_posting("BF87BFW")
    assert_equal Posting, posting.class
    assert_equal "BF87BFW", posting.postKey
  end

  should "test posting deletion" do
    client = PostingClient.new
    result = client.delete_posting('post_key')
    assert_equal DeleteResponse, result.class
  end

  should "test posting updation" do
    client = PostingClient.new
    posting1 = Posting.new
    posting2 = Posting.new
    post_key = "BG5MU5Y"
    response1 = client.get_posting(post_key)
    posting_key = response1.postKey
    posting1.postKey = posting_key
    posting1.heading = "Svitla Systems Inc. +++"
    posting1.body = "Svitla Svitla Svitla"
    response1 = client.update_posting(posting1)
    assert_equal true, response1.success
    response2 = client.get_posting(post_key)
    posting_key = response2.postKey
    posting2.postKey = posting_key
    posting2.heading = "Svitla << Systems << Inc. << +++"
    posting2.body = "Systems Systems Systems"
    response2 = client.update_posting(posting2)
    assert_equal true, response2.success
  end
end
