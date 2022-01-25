class Spree::LineItemResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :quantity
  attribute :price
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :cost_price
  attribute :adjustment_total
  attribute :additional_tax_total
  attribute :promo_total
  attribute :included_tax_total

  # Associations
  attribute :order
  attribute :variant
  attribute :tax_category
  attribute :product
  attribute :adjustments
  attribute :inventory_units
  attribute :line_item_actions
  attribute :actions

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
