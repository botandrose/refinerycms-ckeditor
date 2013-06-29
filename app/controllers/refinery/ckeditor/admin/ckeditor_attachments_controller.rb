module Refinery
  module Ckeditor
    module Admin
      class CkeditorAttachmentsController < ::Refinery::AdminController

        def dialog_images
          @images = Refinery::Image.paginate(:page => params[:page], :per_page => Refinery::Image.per_page(true, true))

          respond_to do |format|
            format.js
          end
        end

        def dialog_resources
          @resources = Refinery::Resource.paginate(:page => params[:page], :per_page => Refinery::Resource.per_page(true))
          respond_to do |format|
            format.js
          end
        end

        def add_images
          if params[:ckeditor]
            @images = Refinery::Image.where(:id => params[:ckeditor][:image_ids])
            @size = Refinery::Images.user_image_sizes[params[:ckeditor][:image_size].to_sym] if params[:ckeditor][:enable_resize]
            @editor = params[:ckeditor][:editor]
          end
          respond_to do |format|
            format.js
          end
        end

        def add_resources
          if params[:ckeditor]
            @resources = Refinery::Resource.where(:id => params[:ckeditor][:resource_ids])
            @editor = params[:ckeditor][:editor]
          end
          respond_to do |format|
            format.js
          end
        end

        protected

        def restrict_controller
          return true
        end


      end
    end
  end
end
