require 'test_helper'
require 'picture_frame'

class DefaultFrameTest < Test::Unit::TestCase
  def setup
    @frame = PictureFrame.create
  end

  def test_frame
    expected =<<-FRAMED
+---------------+
| Hello, World! |
+---------------+
    FRAMED
    assert_equal expected.strip, @frame.frame('Hello, World!')
  end

  def test_multiline
    expected =<<-FRAMED
+--------+
| Hello  |
| World! |
+--------+
    FRAMED
    assert_equal expected.strip, @frame.frame("Hello\nWorld!")
  end
end
