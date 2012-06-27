# -*- encoding: utf-8 -*-
require File.expand_path('../lib/picture_frame/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Schuerig"]
  gem.email         = ["michael@schuerig.de"]
  gem.description   = %q{Draw pretty frames around text.}
  gem.summary       = %q{Draw predefined or custom frames around text.}
  gem.homepage      = "https://github.com/mschuerig/picture_frame"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "picture_frame"
  gem.require_paths = ["lib"]
  gem.version       = PictureFrame::VERSION
end
