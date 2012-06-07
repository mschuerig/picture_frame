  require 'picture_frame/raster'

module PictureFrame
  class Stencil < Raster
    def initialize(*)
      super
    end

    def position(char)
      @raster.each_with_index do |row, ri|
        row.chars.with_index do |cell, ci|
          return ri, ci if cell == char
        end
      end
      []
    end

    def slice_from(pos, to)
      r, c = pos
      n, m = bottom_right

      case to
      when :t, :top
        slice([0, c], [r - 1, c])
      when :r, :right
        slice([r, c + 1], [r, m])
      when :b, :bottom
        slice([r + 1, c], [n, c])
      when :l, :left
        slice([r, 0], [r, c - 1])

      when :tl, :top_left
        slice([0, 0], [r - 1, c - 1])
      when :tr, :top_right
        slice([0, c + 1], [r - 1, m])
      when :br, :bottom_right
        slice([r + 1, c + 1], [n, m])
      when :bl, :bottom_left
        slice([r + 1, 0], [n, c - 1])
      end
    end
  end
end
