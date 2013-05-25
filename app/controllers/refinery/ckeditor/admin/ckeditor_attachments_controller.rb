module Refinery
  module Ckeditor
    module Admin
      class CkeditorAttachmentsController < ::Refinery::AdminController

        def dialog_images
          @images = Refinery::Image.paginate(:page => params[:page], :per_page => Image.per_page(true, true))

          respond_to do |format|
            format.js
          end
        end

        def add_images
          if params[:ckeditor]
            @images = Refinery::Image.where(:id => params[:ckeditor][:image_ids])
            @size = Refinery::Images.user_image_sizes[params[:ckeditor][:image_size].to_sym]
            @editor = params[:ckeditor][:editor]
          end
          respond_to do |format|
            format.js
          end
        end

        protected

        def restrict_controller
          # super unless action_name == 'insert'
        end


      end
    end
  end
end
