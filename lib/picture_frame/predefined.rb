#encoding: utf-8

module PictureFrame
  module Predefined

    class << self
      include Enumerable

      def default
        TEMPLATES[:default]
      end

      def named(name)
        TEMPLATES[name]
      end

      def random
        templates = TEMPLATES.values
        templates[rand(templates.size)]
      end

      def each(&block)
        TEMPLATES.keys.each(&block)
      end
    end

    TEMPLATES = {
      :default   => %q{
+---+
| @ |
+---+
},
      :stars     => %q{
*****
* @ *
*****
},
      :slashes   => %q{
///////
// @ //
///////
},
      :hashes    => %q{
#####
# @ #
#####
},
      # FIXME there might be a problem with multibyte chars
      :ornate    => %q{
%=---=%
∥    ∥
|  @  |
∥    ∥
%=---=%
},
      :ephemeral => %q{
⌜   ⌝
  @
⌞   ⌟
},
      :box       => %q{
  +-----+
 /     /|
+-----+ |
|     | |
|  @  | |
|     | +
|     |/
+-----+
}
    }.freeze
  end
end
