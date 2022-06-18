module Spree::OrderOverride
  extend ActiveSupport::Concern

  included do
    self.whitelisted_ransackable_associations = %w[shipments user order_promotions promotions bill_address ship_address line_items]
    self.whitelisted_ransackable_attributes = %w[completed_at created_at email number state payment_state shipment_state total store_id channel]
  end
end

Spree::Order.include Spree::OrderOverride
