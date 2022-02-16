module Spree::ProductOverride
  extend ActiveSupport::Concern

  included do
    accepts_nested_attributes_for :product_properties, allow_destroy: true, reject_if: :all_blank
  end
end

Spree::Product.include Spree::ProductOverride
