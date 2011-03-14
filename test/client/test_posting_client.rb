require 'helper'

class TestPostingClient < Test::Unit::TestCase
  should "test single posting creation and deletion" do
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

    response = client.update_posting(posting)

    response = client.delete_posting(posting_key)
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

    keys = response.collect{|response| response.post_key}
    response = client.delete_posting(keys)
    assert_equal DeleteResponse, response.class
    assert_equal true, response.success
  end

  should "test posting retrieval" do
    client = PostingClient.new
    posting = client.get_posting("6HAKZQS")
    assert_equal Posting, posting.class
  end

  should "test posting deletion" do
    client = PostingClient.new
    result = client.delete_posting('post_key')
    assert_equal DeleteResponse, result.class
  end
end
