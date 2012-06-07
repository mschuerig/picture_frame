require 'picture_frame/raster'

module PictureFrame
  class Canvas < Raster
    def initialize(*dimensions)
      rows, cols = 0, 0
      dimensions.each do |r, c|
        rows += r
        cols += c
      end

      raster = (1..rows).inject([]) { |r| r << ' ' * cols }
      super(raster)
    end

    def print_at(pos, raster, start = nil, length = nil)
      case pos
      when Array
        overwrite(pos[0], pos[1], raster)

      when :t, :top
        overwrite(0, make_range(start, length), raster)
      when :r, :right
        overwrite(make_range(start, length), width - raster.width, raster)
      when :b, :bottom
        overwrite(height - raster.height, make_range(start, length), raster)
      when :l, :left
        overwrite(make_range(start, length), 0, raster)

      when :tl, :top_left
        overwrite(0, 0, raster)
      when :tr, :top_right
        overwrite(0, width - raster.width, raster)
      when :br, :bottom_right
        overwrite(height - raster.height, width - raster.width, raster)
      when :bl, :bottom_left
        overwrite(height - raster.height, 0, raster)
      end
    end

    private

    def overwrite(row_pos, col_pos, raster)
      if row_pos.is_a?(Range)
        row_pos.each do |r|
          overwrite(r, col_pos, raster)
        end
      elsif col_pos.is_a?(Range)
        col_pos.each do |c|
          overwrite(row_pos, c, raster)
        end
      else
        overwrite1(row_pos, col_pos, raster)
      end
    end

    def overwrite1(row_pos, col_pos, raster)
      cols = raster.width
      raster.each_with_index do |row, r|
        @raster[row_pos + r][col_pos, cols] = row
      end
    end

    def make_range(start, length)
      start..(start + length - 1)
    end
  end
end
