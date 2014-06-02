require 'test_helper'
require 'picture_frame/stencil'

class StencilTest < Minitest::Test
  def setup
    @corner_stencil = PictureFrame::Stencil.new(
      "abcde\n" +
      "12@45\n" +
      "qrstu\n" +
      "vwxyz\n"
    )
  end

  def test_position
    assert_equal [1, 2], @corner_stencil.position('@')
  end

  def test_slice_from
    pp = [1, 2]

    assert_slice_equal ['c'],         @corner_stencil.slice_from(pp, :t)
    assert_slice_equal ['45'],        @corner_stencil.slice_from(pp, :r)
    assert_slice_equal ['s', 'x'],    @corner_stencil.slice_from(pp, :b)
    assert_slice_equal ['12'],        @corner_stencil.slice_from(pp, :l)

    assert_slice_equal ['de'],        @corner_stencil.slice_from(pp, :tr)
    assert_slice_equal ['tu', 'yz'],  @corner_stencil.slice_from(pp, :br)
    assert_slice_equal ['qr', 'vw'],  @corner_stencil.slice_from(pp, :bl)
    assert_slice_equal ['ab'],        @corner_stencil.slice_from(pp, :tl)
  end

  def assert_slice_equal(expected, actual_slice)
    assert_equal expected, actual_slice.send(:raster)
  end
end
