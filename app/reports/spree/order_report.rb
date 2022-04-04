class Spree::OrderReport < ApplicationReport
  report_on 'Spree::Order'

  category_dimension :variant,
                     relation: ->(r) { r.joins(:line_items) },
                     expression: 'spree_line_items.variant_id'
  time_dimension :completed_at

  sum_aggregator :total
  sum_aggregator :adjustment_total
  sum_aggregator :shipment_total
  sum_aggregator :payment_total

  count_aggregator :email
  count_aggregator :guest, expression: 'spree_orders.guest_token'
  count_aggregator :user_id

  # array_aggregator :variant_ids, experssion: 'variants.id'
end
