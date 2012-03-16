module Refinery
  module Admin
    module Ckeditor
      class CellsController < ActionController::Base
        def index
          render :json => cells
        end

        private

        def cells
          Dir['app/cells/*.rb'].each { |f| require f }
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
