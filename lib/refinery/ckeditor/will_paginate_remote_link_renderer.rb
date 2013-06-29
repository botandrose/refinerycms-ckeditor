require "will_paginate/view_helpers/action_view"

module Refinery
  module CKEditor
    class WillPaginateRemoteLinkRenderer < WillPaginate::ActionView::LinkRenderer
      

      private

      def link(text, target, attributes = {})
        attributes[:'data-remote'] = true
        super(text, target, attributes)
      end
      
      
    end
  end
end