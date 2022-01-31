require 'administrate/base_dashboard'

module Administrate::BaseDashboardOverride
  extend ActiveSupport::Concern

  included do
    def filterable_attributes
      attribute_types.keys.select do |attribute|
        attribute_types[attribute].filterable?
      end
    end
  end
end

Administrate::BaseDashboard.include Administrate::BaseDashboardOverride
