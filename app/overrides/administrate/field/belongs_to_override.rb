require 'administrate/field/belongs_to'

module Administrate::Field::BelongsToOverride
  extend ActiveSupport::Concern

  included do
    private

    def candidate_resources
      scope = options[:scope] ? options[:scope].call(self) : associated_class.all

      order = options.delete(:order)
      order ? scope.reorder(order) : scope
    end
  end
end

Administrate::Field::BelongsTo.include Administrate::Field::BelongsToOverride
