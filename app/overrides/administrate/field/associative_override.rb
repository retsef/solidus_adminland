require 'administrate/field/associative'

module Administrate::Field::AssociativeOverride
  extend ActiveSupport::Concern

  class_methods do
    def associated_class_name(resource_class, attr)
      associated_class(resource_class, attr).name
    end
  end
end

Administrate::Field::Associative.include Administrate::Field::AssociativeOverride
