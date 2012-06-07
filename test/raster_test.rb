require 'test_helper'
require 'picture_frame/raster'

class RasterTest < Test::Unit::TestCase
  def setup
    @raster = PictureFrame::Raster.new(
      "abcde\n" +
      "12345\n" +
      "vwxyz\n"
    )
  end

  def test_dimensions
    assert_equal [3, 5], @raster.dimensions
  end

  def test_bottom_right
    assert_equal [2, 4], @raster.bottom_right
  end

  def test_at
    assert_equal '4', @raster[1, 3]
  end

  def test_slice
    expected = PictureFrame::Raster.new("bc\n23")
    assert_equal expected, @raster.slice([0, 1], [1, 2])
  end

end
