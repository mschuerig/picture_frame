require 'test_helper'
require 'picture_frame/canvas'

class CanvasTest < Test::Unit::TestCase
  def setup
    @canvas = PictureFrame::Canvas.new([3, 4])

    @corner_stencil     = PictureFrame::Stencil.new("12\nab")
    @top_bottom_stencil = PictureFrame::Stencil.new("1\na")
    @left_right_stencil = PictureFrame::Stencil.new("12")
  end

  def test_dimensions
    assert_equal [3, 4], @canvas.dimensions
  end

  def test_print_at_tl
    @canvas.print_at(:tl, @corner_stencil)
    assert_equal "12  \nab  \n    ", @canvas.to_s
  end

  def test_print_at_tr
    @canvas.print_at(:tr, @corner_stencil)
    assert_equal "  12\n  ab\n    ", @canvas.to_s
  end

  def test_print_at_br
    @canvas.print_at(:br, @corner_stencil)
    assert_equal "    \n  12\n  ab", @canvas.to_s
  end

  def test_print_at_bl
    @canvas.print_at(:bl, @corner_stencil)
    assert_equal "    \n12  \nab  ", @canvas.to_s
  end

  def test_print_at_t
    @canvas.print_at(:t, @top_bottom_stencil, 1, 2)
    assert_equal " 11 \n aa \n    ", @canvas.to_s
  end

  def test_print_at_r
    @canvas.print_at(:r, @left_right_stencil, 1, 1)
    assert_equal "    \n  12\n    ", @canvas.to_s
  end

  def test_print_at_b
    @canvas.print_at(:b, @top_bottom_stencil, 1, 2)
    assert_equal "    \n 11 \n aa ", @canvas.to_s
  end

  def test_print_at_l
    @canvas.print_at(:l, @left_right_stencil, 1, 1)
    assert_equal "    \n12  \n    ", @canvas.to_s
  end
end
