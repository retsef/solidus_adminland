require 'administrate/field/base'

module Administrate::Field::BaseOverride
  extend ActiveSupport::Concern

  class_methods do
    def filterable?
      false
    end
  end

  included do
    def to_partial_path
      return "/fields/#{self.class.field_type}/#{page}" unless lookup_context.exists?(page, lookup_context.prefixes, true)

      lookup_context.find(page, lookup_context.prefixes, true).virtual_path.gsub("_#{page}", "#{page}")
    end

    private

    def lookup_context
      return @lookup_context if @lookup_context.present?

      @lookup_context ||= ::ActionView::LookupContext.new('app/views', {}, partial_prefixes)
    end

    def partial_prefixes
      return @partial_prefixes if @partial_prefixes.present?

      @partial_prefixes = []
      @partial_prefixes << "fields/#{resource.class.name.underscore}/#{attribute}"
      @partial_prefixes << "fields/#{resource.class.name.underscore}/#{self.class.field_type}"
      @partial_prefixes << "fields/#{resource.class.name.underscore}"
      @partial_prefixes << "fields/#{self.class.field_type}" # Administrate default

      @partial_prefixes
    end
  end
end

Administrate::Field::Base.include Administrate::Field::BaseOverride
