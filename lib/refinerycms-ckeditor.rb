require "refinery/ckeditor/version"

module Refinery
  module CKEditor
    class Engine < Rails::Engine; end if defined?(Rails::Engine)
  end
end
