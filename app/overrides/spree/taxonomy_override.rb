module Spree::TaxonomyOverride
  extend ActiveSupport::Concern

  included do
    accepts_nested_attributes_for :taxons, reject_if: :all_blank
  end
end

Spree::Taxonomy.include Spree::TaxonomyOverride