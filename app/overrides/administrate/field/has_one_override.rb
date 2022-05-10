require 'administrate/field/has_one'

module Administrate::Field::HasOneOverride
  extend ActiveSupport::Concern

  included do
    private

    def relative_associated_class
      return associated_class if data.nil?

      data.class
    end

    def resolver
      @resolver ||=
        Administrate::ResourceResolver.new("admin/#{relative_associated_class.name}")
    end
  end
end

Administrate::Field::HasOne.include Administrate::Field::HasOneOverride
