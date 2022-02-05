module Spree::PromotionOverride
  extend ActiveSupport::Concern

  included do
    accepts_nested_attributes_for :codes, reject_if: :all_blank
    alias_method :promotion_codes_attributes=, :codes_attributes=
  end
end

Spree::Promotion.include Spree::PromotionOverride
