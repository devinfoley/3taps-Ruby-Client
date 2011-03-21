require 'helper'

class TestPosting < Test::Unit::TestCase
  should "create posting with empty images array" do
    posting = Posting.new
    assert_equal [], posting.images
    assert_equal({}, posting.annotations)
  end

  should "create posting with empty status attribute" do
    posting = Posting.new
    assert_equal StatusUpdateRequest, posting.status.class
    assert_equal String, posting.status.event.class
    assert_equal Hash, posting.status.attributes.class
    assert_equal Array, posting.status.errors.class
  end

  should "create posting with not empty images array" do
    posting = Posting.new(
      :images => ["image_path"],
      :history => ["old_posting"],
      :annotations => {'annotation' => "value"}
    )
    assert_equal ["image_path"], posting.images
    assert_equal ["old_posting"], posting.history
    assert_equal({'annotation' => "value"}, posting.annotations)
  end
end
