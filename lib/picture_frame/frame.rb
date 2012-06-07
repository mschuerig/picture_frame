require 'picture_frame/canvas'
require 'picture_frame/image'
require 'picture_frame/stencil'

module PictureFrame
  class Frame
    def initialize(template_string, options = {})
      @template    = Stencil.new(template_string)
      @placeholder = options[:placeholder] || '@'
    end

    def frame(text)
      image = Image.new(text)

      Canvas.new(@template.bottom_right, image.dimensions).tap do |canvas|
        pp = placeholder_position
        return '' if pp.empty?

        r1, c1 = pp
        rn, cm = image.dimensions

        canvas.print_at(:tl, @template.slice_from(pp, :tl))
        canvas.print_at(:tr, @template.slice_from(pp, :tr))
        canvas.print_at(:br, @template.slice_from(pp, :br))
        canvas.print_at(:bl, @template.slice_from(pp, :bl))

        canvas.print_at(:t, @template.slice_from(pp, :t), c1, cm)
        canvas.print_at(:b, @template.slice_from(pp, :b), c1, cm)
        canvas.print_at(:l, @template.slice_from(pp, :l), r1, rn)
        canvas.print_at(:r, @template.slice_from(pp, :r), r1, rn)

        canvas.print_at(pp, image)
      end.to_s
    end

    private

    def placeholder_position
      @placeholder_position ||= @template.position(@placeholder)
    end
  end
end
