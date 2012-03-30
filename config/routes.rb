Refinery::Core::Engine.routes.draw do
  namespace :admin, :path => 'refinery' do
    namespace :ckeditor do
      resources :cells, :only => :index
    end
  end
end
