module PictureFrame
  class Raster
    include Enumerable

    def initialize(string_or_rows)
      @raster = string_or_rows.is_a?(String) ? string_or_rows.split("\n") : string_or_rows

      trim_around!
      pad_short_rows!
    end

    def ==(other)
      return unless other.is_a?(Raster)
      @raster == other.raster
    end

    def dimensions
      @dimensions ||= [@raster.size, (@raster.map { |r| r.length }.max || 0)]
    end

    def top_left
      [0, 0]
    end

    def bottom_right
      [dimensions[0] - 1, dimensions[1] - 1]
    end

    def height
      dimensions[0]
    end

    def width
      dimensions[1]
    end

    def at(row, col)
      @raster[row][col]
    end

    alias [] at

    def slice(top_left, bottom_right)
      top_bottom = (top_left[0]..bottom_right[0])
      left_right = (top_left[1]..bottom_right[1])

      array = top_bottom.inject([]) do |rows, ri|
        rows << @raster[ri].slice(left_right)
      end

      self.class.new(array)
    end

    def each(&block)
      @raster.each(&block)
    end

    def each_with_index(&block)
      @raster.each_with_index(&block)
    end

    def to_s
      @raster.join("\n")
    end

    protected

    attr_reader :raster

    private

    def trim_around!
      # trim; extract and add side-trimming
      @raster.shift while @raster.first && @raster.first.empty?
      @raster.pop   while @raster.last  && @raster.last.empty?
    end

    def pad_short_rows!
      @raster.each do |r|
        r << ' ' * (width - r.length)
      end
    end
  end
end
