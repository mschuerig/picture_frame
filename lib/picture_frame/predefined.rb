#encoding: utf-8

module PictureFrame
  module Predefined
    def self.default
      TEMPLATES[:default]
    end

    def self.named(name)
      TEMPLATES[name]
    end

    def self.random
      templates = TEMPLATES.values
      templates[rand(templates.size)]
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
      :baroque   => %q{
%=---=%
∥     ∥
|  @  |
∥     ∥
%=---=%
},
      :ephemeral => %q{
⌜   ⌝
  @
⌞   ⌟
},
      :box => %q{
  +---+
 /   /|
+---+ |
|   | |
| @ | |
|   | +
|   |/
+---+
}
    }.freeze
  end
end
