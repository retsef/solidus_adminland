require 'administrate/field/base'

module Administrate::Field::BaseOverride
  extend ActiveSupport::Concern

  class_methods do
    def filterable?
      false
    end

    def editable_inline?
      false
    end
  end

  included do
    def editable_inline?
      options.fetch(:editable_inline, self.class.editable_inline?)
    end

    def to_partial_path
      return "/fields/#{self.class.field_type}/#{page}" unless lookup_context.exists?(page, lookup_context.prefixes, true)

      lookup_context.find(page, lookup_context.prefixes, true).virtual_path.gsub("_#{page}", page.to_s)
    end

    private

    def lookup_context
      return @lookup_context if @lookup_context.present?

      @lookup_context ||= ::ActionView::LookupContext.new('app/views', {}, partial_prefixes)
    end

    def partial_prefixes
      return @partial_prefixes if @partial_prefixes.present?

      resource_class = resource.class
      resource_base_class_name = resource_class.base_class.name.underscore
      resource_class_name = resource_class.name.underscore
      field_type = self.class.field_type

      @partial_prefixes = []

      @partial_prefixes << "fields/#{resource_class_name}/#{attribute}"
      @partial_prefixes << "fields/#{resource_class_name}/#{field_type}"
      @partial_prefixes << "fields/#{resource_class_name}"

      @partial_prefixes << "fields/#{resource_base_class_name}/#{attribute}"
      @partial_prefixes << "fields/#{resource_base_class_name}/#{field_type}"
      @partial_prefixes << "fields/#{resource_base_class_name}"

      @partial_prefixes << "fields/#{field_type}" # Administrate default

      @partial_prefixes.uniq
    end
  end
end

Administrate::Field::Base.include Administrate::Field::BaseOverride
