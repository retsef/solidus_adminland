class Spree::VariantReport < ApplicationReport
  report_on 'Spree::Variant'

  category_dimension :order,
                     relation: ->(r) { r.joins(:orders) }

  time_dimension :purchased_at,
                 relation: ->(r) { r.joins(:orders).where(order: { state: :complete }) },
                 expression: 'spree_orders.completed_at'

  sum_aggregator :price
  # array_aggregator :variant_ids, experssion: 'variants.id'
end
