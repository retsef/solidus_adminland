require 'administrate/field/has_many'

module Administrate::Field::HasManyOverride
  extend ActiveSupport::Concern

  included do
    private

    def candidate_resources
      scope = options[:scope] ? options[:scope].call(self) : associated_class.all
      scope = scope.includes(*options.fetch(:includes)) if options.key?(:includes)

      order = options.delete(:order)
      order ? scope.reorder(order) : scope
    end
  end
end

Administrate::Field::HasMany.include Administrate::Field::HasManyOverride
