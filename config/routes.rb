Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :ckeditor, :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'ckeditor' do
        get 'ckeditor_attachments/dialog_images', :to => 'ckeditor_attachments#dialog_images'
        post 'ckeditor_attachments/add_images', :to => 'ckeditor_attachments#add_images'
      end
    end
  end
end
