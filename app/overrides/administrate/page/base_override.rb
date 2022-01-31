# require 'administrate/page/base'

module Administrate::Page::BaseOverride
  extend ActiveSupport::Concern

  included do
    def resource_class_name
      @resource_class_name ||= dashboard.class.to_s.scan(/(.+)Dashboard/).first.first
    end

    def resource_class
      @resource_class ||= resource_class_name.constantize
    end

    def resource_name
      @resource_name ||= resource_class.model_name.to_s.underscore
    end

    def resource_path
      # @resource_path ||= resource_name.gsub("/", "_")
      @resource_path ||= resource_class.model_name.singular_route_key # route_key
    end
  end
end

Administrate::Page::Base.include Administrate::Page::BaseOverride
