require 'picture_frame/version'
require 'picture_frame/frame'
require 'picture_frame/predefined'

module PictureFrame
  def self.create(frame_spec = nil)
    case frame_spec
    when String
      template = frame_spec
    when :random
      template = Predefined.random
    when Symbol
      template = Predefined::named(frame_spec)
    when nil
      template = Predefined::default
    end
    raise ArgumentError, "No such template: #{frame_spec.inspect}" unless template
    Frame.new(template)
  end
end
