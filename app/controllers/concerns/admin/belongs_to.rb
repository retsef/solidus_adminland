module Admin
  module BelongsTo
    extend ActiveSupport::Concern

    included do
      helper_method :parent_page

      private

      def parent_page
        @parent_page ||= Administrate::Page::Show.new(parent_dashboard, requested_parent_resource)
      end

      def valid_action?(name, resource = dashboard.class.to_s.remove('Dashboard'))
        routes.include?([resource.to_s.underscore.pluralize, name.to_s])
      end

      # def after_resource_destroyed_path(_requested_resource)
      #   { action: :index }
      # end

      def after_resource_created_path(_requested_resource)
        [namespace, requested_parent_resource, resource_class]
      end

      def after_resource_updated_path(_requested_resource)
        [namespace, requested_parent_resource, resource_class]
      end
    end
  end
end
