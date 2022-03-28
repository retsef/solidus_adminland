require 'administrate/field/select'

module Administrate::Field::SelectOverride
  extend ActiveSupport::Concern

  included do
    def include_multiple_option
      options.fetch(:multiple, false)
    end
  end
end

Administrate::Field::Select.include Administrate::Field::SelectOverride
