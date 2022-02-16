require 'administrate/field/base'

module Administrate::Field::DeferredOverride
  extend ActiveSupport::Concern

  included do
    def filterable?
      options.fetch(:filterable, deferred_class.filterable?)
    end

    def filterable_fields
      options.fetch(:filterable_fields)
    end

    def editable_inline?
      options.fetch(:editable_inline, deferred_class.editable_inline?)
    end
  end
end

Administrate::Field::Deferred.include Administrate::Field::DeferredOverride
