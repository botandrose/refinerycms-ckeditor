module Refinery
  module Admin
    module Ckeditor
      class CellsController < ActionController::Base
        def index
          render :json => cells
        end

        private

        def cells
          Dir['app/cells/*.rb'].each do |path|
            require File.basename(path, ".rb")
          end
          cells = Cell::Base.descendants - [Cell::Rails]
          cells.inject([]) do |array, klass|
            klass.action_methods.each do |action|
              name = klass.to_s.sub /Cell$/, ''
              array << ["#{name} - #{action.titleize}", "#{name.underscore}/#{action}"]
            end
            array
          end
        end
      end
    end
  end
end
