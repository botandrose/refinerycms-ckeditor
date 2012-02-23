# -*- encoding: utf-8 -*-
require File.expand_path('../lib/refinery/ckeditor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Micah Geisel"]
  gem.email         = ["micah@botandrose.com"]
  gem.description   = %q{Replaces WYMEditor with CKEditor in Refinery CMS}
  gem.summary       = %q{Replaces WYMEditor with CKEditor in Refinery CMS. Also adds drag and drop sidebars for Images and Files.}
  gem.homepage      = "https://github.com/botandrose/refinerycms-ckeditor"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "refinerycms-ckeditor"
  gem.require_paths = ["lib"]
  gem.version       = Refinery::CKEditor::VERSION
end
