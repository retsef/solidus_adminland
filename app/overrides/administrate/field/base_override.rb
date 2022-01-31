require 'administrate/field/base'

module Administrate::Field::BaseOverride
  extend ActiveSupport::Concern

  included do
    def self.filterable?
      false
    end
  end
end

Administrate::Field::Base.include Administrate::Field::BaseOverride
