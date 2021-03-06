require 'picture_frame/version'
require 'picture_frame/frame'
require 'picture_frame/predefined'

module PictureFrame
  class << self

    def create(frame_spec = nil, options = {})
      case frame_spec
      when String
        template = frame_spec
      when :random
        template = Predefined.random
      when Symbol
        template = Predefined.named(frame_spec)
      when nil
        template = Predefined.default
      end
      raise ArgumentError, "No such template: #{frame_spec.inspect}" unless template
      Frame.new(template, options)
    end

    def showcase(text)
      Predefined.each do |name|
        puts name.inspect
        puts create(name).frame(text)
        puts
      end
    end

  end
end
