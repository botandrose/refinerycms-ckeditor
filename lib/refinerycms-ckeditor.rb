require "refinery/ckeditor/version"
require "refinery/ckeditor/will_paginate_remote_link_renderer"

module Refinery
  module CKEditor
    class Engine < Rails::Engine; end if defined?(Rails::Engine)
  end
end
