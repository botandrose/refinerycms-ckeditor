Refinery::Core.configure do |config|
  config.register_stylesheet "refinery/ckeditor", :media => 'screen'

  config.register_javascript "ckeditor/ckeditor"
  config.register_javascript "refinery/ckeditor"
end
