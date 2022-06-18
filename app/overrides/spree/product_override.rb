module Spree::ProductOverride
  extend ActiveSupport::Concern

  included do
    accepts_nested_attributes_for :product_properties, allow_destroy: true, reject_if: :all_blank

    has_rich_text :description

    delegate :track_inventory, :track_inventory=, to: :find_or_build_master

    self.whitelisted_ransackable_associations = %w[variants_including_master master variants taxons option_types product_properties]
    self.whitelisted_ransackable_attributes = %w[name slug available_on discontinue_on promotionable]
  end
end

Spree::Product.include Spree::ProductOverride
