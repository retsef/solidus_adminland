# require 'administrate/page/base'

module Administrate::Page::BaseOverride
  extend ActiveSupport::Concern

  included do
    def resource_class_name
      @resource_class_name ||= dashboard.try(:resource_class_name) || relative_resource_class_name
    end

    def relative_resource_class_name
      @relative_resource_class_name ||= dashboard.class.to_s.scan(/(.+)Dashboard/).first.first
    end

    def resource_class
      @resource_class ||= resource_class_name.constantize
    end

    def resource_name
      # @resource_name ||= resource_class.model_name.to_s.underscore
      @resource_name ||= relative_resource_class_name.to_s.underscore
    end

    def resource_path
      # @resource_path ||= resource_name.gsub("/", "_")
      @resource_path ||= resource_class.model_name.singular_route_key # route_key
    end

    # Resource siblings navigation
    def resource_pointer
      @resource_pointer ||= resource.seek(%i[id asc])
    end

    def next_resource
      @next_resource ||= resource_pointer.next
    end

    def next_resource?
      return false unless next_resource
      return false if next_resource == resource

      true
    end

    def prev_resource
      @prev_resource ||= resource_pointer.previous
    end

    def prev_resource?
      return false unless prev_resource
      return false if prev_resource == resource

      true
    end
  end
end

Administrate::Page::Base.include Administrate::Page::BaseOverride
