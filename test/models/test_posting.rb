require 'helper'

class TestPosting < Test::Unit::TestCase
  should "create posting with empty images array" do
    posting = Posting.new
    assert_equal [], posting.images
    assert_equal [], posting.history
    assert_equal({}, posting.annotations)
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

  should ""
end
