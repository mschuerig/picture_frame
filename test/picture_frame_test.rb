require 'test_helper'

class PictureFrameTest < Minitest::Test
  def test_empty_template
    frame = PictureFrame.create('')
    assert_equal '', frame.frame('Hello, World!')
  end

  def test_simplistic_template
    frame = PictureFrame.create('@')
    assert_equal 'Hello, World!', frame.frame('Hello, World!')
  end

  def test_horizontal_template
    frame = PictureFrame.create('- @ -')
    assert_equal '- Hello, World! -', frame.frame('Hello, World!')
  end

  def test_vertical_template
    frame = PictureFrame.create %q{
^
@
v
}
    expected = %q{
^^^^^^^^^^^^^
Hello, World!
vvvvvvvvvvvvv
}
    assert_equal expected.strip, frame.frame('Hello, World!')
  end
end
